DROP TABLE IF EXISTS sales.dim_supplier ;

CREATE TABLE sales.dim_supplier (
    supplier_sk           INT           IDENTITY(1, 1)
  , supplier_nk           INT           NOT NULL
  , supplier_name         NVARCHAR(100) NOT NULL
  , is_current_flag       BIT
        CONSTRAINT df_dim_supplier_is_current_flag
            DEFAULT (1)
  , is_deleted_flag       BIT
        CONSTRAINT df_dim_supplier_is_deleted_flag
            DEFAULT (0)
  , eff_from_utc_datetime DATETIME
        CONSTRAINT df_dim_supplier_eff_from_utc_datetime
            DEFAULT GETUTCDATE() NOT NULL
  , eff_to_utc_datetime   DATETIME
) ;

CREATE CLUSTERED COLUMNSTORE INDEX idx_CCI_sales_dim_supplier
ON sales.dim_supplier
WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0, DATA_COMPRESSION = COLUMNSTORE) ;

ALTER TABLE sales.dim_supplier
ADD CONSTRAINT pk_dim_supplier
    PRIMARY KEY (supplier_sk) ;