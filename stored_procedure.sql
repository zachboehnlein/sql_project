%%sql
DELIMITER $$
DROP PROCEDURE IF EXISTS get_SPY_close_on_date;
CREATE PROCEDURE get_AAPL_close_on_date(in_AAPL_date DATETIME)
BEGIN
  SET @AAPL_date:=in_AAPL_date;
SELECT AAPL_date, AAPL_close
FROM AAPL 
WHERE AAPL_date = @AAPL_date
GROUP BY AAPL_date;
END$$
DELIMITER ;

CALL get_AAPL_close_on_date('2020-01-01');

/*This stored procedure creates a new table everytime the SPY table 
is updated with new information. This is useful because it will take 
the most recent stock prices, which will be the most useful and compile 
them in to a new table for us to keep up to date on the most recent prices 
of the SPY ETF which is a good indicator or market performance. On that note 
sadly I looked it up and I wanted to do this with every single stock, 
but I would basically have to create a trigger for each one instead of of 
storing them all in the same table. */ 