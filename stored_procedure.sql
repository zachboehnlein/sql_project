%%sql
DELIMITER $$
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

 /*
This gets the specific close on whatever date I give it. Making it useful 
for checking out abnormal days in the stock market or seeing the effects of 
large scale events  like acquisitions or executives selling off many shares and see 
the effects on AAPL stock on that given day. This helps with decisions making for 
future purchasing or selling of their stock. 
 */