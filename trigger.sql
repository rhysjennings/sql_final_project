################
# Trigger
################
/* The purpose of trigger is to help keep track of the all changes you make incase you would like to return to previous version or go look into when a change was made.*/
CREATE TABLE google_trends_log (
    Artist Varchar(255),
    trend_pct INT (50),
    date_log date,
    Log_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    
);

DELIMITER $$
Create Trigger google_trends_update
	AFTER UPDATE ON google_trends
	For each ROW
BEGIN
	Insert into google_trends_log(Artist, trend_pct, date_log, Log_Date)
	Values (Old.Artist, Old.trend_pct, Old.date, now());
END$$
DELIMITER ;

Select * 
From google_trends
Where Artist ='Justin Bieber'
ORder By Rand()
Limit 1;

Update google_trends
Set trend_pct =65
	Where Artist = 'Justin Bieber';


SELECT *
From google_trends_log;


