CREATE TABLE 
stock_watch (
SPY_date DATETIME, 
SPY_close DOUBLE,
SPY_volume DOUBLE
);

SELECT stock_id();

DELIMITER $$ 
CREATE TRIGGER SPY_watch 
AFTER UPDATE ON SPY 
FOR EACH ROW 
BEGIN 
INSERT INTO stock_watch
(stock_id, SPY_date, SPY_close, SPY_volume)
 VALUES ((stock_id(), NEW.SPY_date, NEW.SPY_close, SPY_volume)
 
 END$$ 
 
 DELIMITER
 
 /*This stored procedure creates a new table everytime the SPY table 
is updated with new information. This is useful because it will take 
the most recent stock prices, which will be the most useful and compile 
them in to a new table for us to keep up to date on the most recent prices 
of the SPY ETF which is a good indicator or market performance. On that note 
sadly I looked it up and I wanted to do this with every single stock, 
but I would basically have to create a trigger for each one instead of of 
storing them all in the same table. */ 
