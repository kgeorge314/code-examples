DROP TABLE IF EXISTS sales.dim_customer ;

CREATE TABLE sales.dim_customer (
    customer_sk           INT           IDENTITY(1, 1)
  , customer_nk           INT           NOT NULL
  , customer_name         NVARCHAR(100) NOT NULL
  , is_current_flag       BIT
        CONSTRAINT df_dim_customer_is_current_flag
            DEFAULT (1)
  , is_deleted_flag       BIT
        CONSTRAINT df_dim_customer_is_deleted_flag
            DEFAULT (0)
  , eff_from_utc_datetime DATETIME
        CONSTRAINT df_dim_customer_eff_from_utc_datetime
            DEFAULT GETUTCDATE() NOT NULL
  , eff_to_utc_datetime   DATETIME
) ;


CREATE CLUSTERED COLUMNSTORE INDEX idx_CCI_sales_dim_customer
ON sales.dim_customer
WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ;

ALTER TABLE sales.dim_customer
ADD CONSTRAINT pk_dim_customer
    PRIMARY KEY (customer_sk) ;