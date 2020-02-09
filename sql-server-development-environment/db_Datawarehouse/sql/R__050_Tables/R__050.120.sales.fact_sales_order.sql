DROP TABLE IF EXISTS sales.fact_sales_order ;

CREATE TABLE sales.fact_sales_order (
    date_key       DATE          NOT NULL
  , sales_order_nk INT           NOT NULL
  , customer_sk    INT           NOT NULL
  , supplier_sk    INT           NOT NULL
  , product_sk     INT           NOT NULL
  , order_quantity INT           NOT NULL
  , order_notes    NVARCHAR(400) NOT NULL
) ;