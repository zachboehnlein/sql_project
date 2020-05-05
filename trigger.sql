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
 
 /*
This gets the specific close on whatever date I give it. Making it useful 
for checking out abnormal days in the stock market or seeing the effects of 
large scale events  like acquisitions or executives selling off many shares and see 
the effects on AAPL stock on that given day. This helps with decisions making for 
future purchasing or selling of their stock. 
 */