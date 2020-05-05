/*This stored procedure will retun the the avg trend percentage of an artist which we use later to measure if an artist is trending*/

DELIMITER $$
Drop PROCEDURE If Exists returnArtistAvgTrend$$
Create PROCEDURE returnArtistAvgTrend(inArtistName Text)
Begin
	SET @ArtistName := inArtistName;

Select Artist, avg(trend_pct) AS Average
From google_trends
Where Artist = @ArtistName
Group By Artist;

End$$
DELIMITER ;

Call returnArtistAvgTrend("The Strokes");