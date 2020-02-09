DROP TABLE IF EXISTS sales.dim_product ;

CREATE TABLE sales.dim_product (
    product_sk            INT           IDENTITY(1, 1)
  , product_nk            INT           NOT NULL
  , product_name          NVARCHAR(100) NOT NULL
  , is_current_flag       BIT
        CONSTRAINT df_dim_product_is_current_flag
            DEFAULT (1)
  , is_deleted_flag       BIT
        CONSTRAINT df_dim_product_is_deleted_flag
            DEFAULT (0)
  , eff_from_utc_datetime DATETIME
        CONSTRAINT df_dim_product_eff_from_utc_datetime
            DEFAULT GETUTCDATE() NOT NULL
  , eff_to_utc_datetime   DATETIME
) ;


CREATE CLUSTERED COLUMNSTORE INDEX idx_CCI_sales_dim_product
ON sales.dim_product
WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ;

ALTER TABLE sales.dim_product
ADD CONSTRAINT pk_dim_product
    PRIMARY KEY (product_sk) ;

