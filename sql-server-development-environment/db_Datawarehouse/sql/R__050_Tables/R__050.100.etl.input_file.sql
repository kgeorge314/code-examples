DROP TABLE IF EXISTS etl.input_file ;

CREATE TABLE etl.input_file (
    event_id INT          IDENTITY(1, 1)
        CONSTRAINT pk_etl_input_file PRIMARY KEY CLUSTERED
  , file_path     NVARCHAR(100)
  , business_date DATE NOT NULL
  , is_processed  BIT          NOT NULL
        CONSTRAINT df_etl_input_file
            DEFAULT (0)
) ;