-- Extension: postgis

-- DROP EXTENSION postgis;

-- CREATE EXTENSION postgis
--     SCHEMA public
--     VERSION "3.0.1";

-- #Convex Hull

SELECT ST_AsText(ST_ConvexHull(ST_GeomFromText('MULTIPOINT(-118.283554 34.020075, 
											   -118.290695 34.019978, 
											   -118.282525 34.018586, 
											   -118.282789 34.021719, 
											   -118.286219 34.023958, 
											   -118.28709 34.022884, 
											   -118.282177 34.021666, 
											   -118.283312 34.020115, 
											   -118.286318 34.020283, 
											   -118.289985 34.020044, 
											   -118.288928 34.020388, 
											   -118.286479 34.022438, 
											   -118.290776 34.019295, 
											   -118.285308 34.020291, 
											   -118.282748 34.021492)')));
											   
-- Output of this query - finding the points of the convex hull										   
-- 	
-- POLYGON((-118.282525 34.018586,
-- -118.290776 34.019295,
-- -118.290695 34.019978,
-- -118.286219 34.023958,
-- -118.282177 34.021666,
-- -118.282525 34.018586))


-- Finding four nearest neighbours to the point - Hahn Plaza
Create table all_locations (id integer, loc_name varchar, geom geometry, primary key(id));
Insert INTO all_locations VALUES(1,'Hahn Plaza (center point)','POINT(-118.285308 34.020291)'),
			    (2,'Cinematics Lib','POINT(-118.283554 34.020075)'),
			    (3,'Gerontology Lib','POINT(-118.290695 34.019978)'),
    			(4,'Gaughan Tiberti Lib','POINT(-118.282525 34.018586)'),
			    (5,'Leavey Lib','POINT(-118.282789 34.021719)'),
			    (6,'Wilson Dental Lib','POINT(-118.286219 34.023958)'),
			    (7,'Little Galen','POINT(-118.28709 34.022884)'),
			    (8,'Starbucks Trojan','POINT(-118.282177 34.021666)'),
			    (9,'LiteraTea','POINT(-118.283312 34.020115)'),
			    (10,'Panda Express','POINT(-118.286318 34.020283)'),
			    (11,'Tutor Hall Cafe','POINT(-118.289985 34.020044)'),
			    (12,'Epstein F Plaza','POINT(-118.288928 34.020388)'),
				(13,'Noble Plaza','POINT(-118.286479 34.022438)'),
				(14,'Ogasawara Plaza','POINT(-118.290776 34.019295)'),
				(15,'Martens Plaza','POINT(-118.282748 34.021492)');
				
				
SELECT distance.loc_name from (select ST_Distance(h.geom, d.geom)as dist,d.id,d.loc_name 
							from all_locations as d, all_locations as h
							   where  h.id=1 and d.id<>1) as distance order by (dist) LIMIT 4;


-- OUTPUT [4 nearest points to Hahn Plaza]

-- table with tableName: loc_name

-- Row1: Panda Express
-- Row2: Cinematics Lib
-- Row3: LiteraTea
-- Row4: Noble Plaza