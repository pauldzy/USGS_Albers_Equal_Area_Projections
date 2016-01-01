INSERT INTO spatial_ref_sys(
    srid
   ,auth_name
   ,auth_srid
   ,proj4text
   ,srtext
) VALUES (
    5070
   ,'NAD83 Continental US Albers Equal Area USGS'
   ,5070
   ,'+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
   ,'PROJCS["NAD83 Continental US Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",-96],PARAMETER["Standard_Parallel_1",29.5],PARAMETER["Standard_Parallel_2",45.5],PARAMETER["latitude_of_center",23],UNIT["Meter",1],AUTHORITY["EPSG","5070"]]'
);

