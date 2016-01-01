# USGS Albers Equal Area Projections
The [United States Geological Survey] (http://www.usgs.gov) and other US federal agencies have provided data utilizing a set of Albers Equal Area Conic projections for decades (if you know the exact history of these projections or a good link, please drop me a line).  These projections are often associated with the USGS National Atlas from 1970 but have an even longer history before that.

In any case, support for these projections in modern GIS systems has been slow to appear as only a few have ever been registered with the [EPSG registry](https://www.epsg-registry.org/).  This repository contains installation scripts and basic information on each projection for use in [Oracle Spatial] (http://www.oracle.com/us/products/database/options/spatial/overview/index.html), [PostGIS] (http://postgis.net/), [Esri ArcGIS] (https://www.arcgis.com/features/) and [Safe Software FME] (http://www.safe.com/fme/fme-desktop/index_b.php).  If you have scripts for other GIS systems please fork and submit a pull to me to add them.

###Continental United States
* Projection: Albers Equal Area
* Datum: NAD 1983
* False_Easting: 0.0
* False_Northing: 0.0
* Central_Meridian: -96.0
* Standard_Parallel_1: 29.5
* Standard_Parallel_2: 45.5
* Latitude_Of_Origin: 23.0
* Linear Unit: Meter (1.0)

#####Existing SRS Identifiers:
1. EPSG: **5070**
2. Oracle: **5070** added with 12c, otherwise custom SRS required
3. Esri: **NAD_1983_Contiguous_USA_Albers**
4. FME: None
5. PostGIS: None
6. SpatialReference.org: [SR-ORG:6703] (http://spatialreference.org/ref/sr-org/6703/)

###Hawaii
* Projection: Albers Equal Area
* Datum: NAD 1983
* False_Easting: 0.0
* False_Northing: 0.0
* Central_Meridian: -157.0
* Standard_Parallel_1: 8.0
* Standard_Parallel_2: 18.0
* Latitude_Of_Origin: 3.0
* Linear Unit: Meter (1.0)

#####Existing SRS Identifiers:
1. EPSG: None
2. Oracle: None
3. Esri: None
4. FME: None
5. PostGIS: None
6. SpatialReference.org: None (note the latitude origin does not match ESRI:102007)

###Alaska
* Projection: Albers Equal Area
* Datum: NAD 1983
* False_Easting: 0.0
* False_Northing: 0.0
* Central_Meridian: -154.0
* Standard_Parallel_1: 55.0
* Standard_Parallel_2: 65.0
* Latitude_Of_Origin: 50.0
* Linear Unit: Meter (1.0)

#####Existing SRS Identifiers:
1. EPSG: **3338**
2. Oracle: **3338**  added with 12c, otherwise custom SRS required
3. Esri: **NAD_1983_Alaska_Albers**
4. FME: None
5. PostGIS: None
6. SpatialReference.org: [EPSG:3338](http://spatialreference.org/ref/epsg/3338/)

###Puerto Rico/US Virgin Islands
* Projection: Albers Equal Area
* Datum: NAD 1983
* False_Easting: 0.0
* False_Northing: 0.0
* Central_Meridian: -66.0
* Standard_Parallel_1: 8.0
* Standard_Parallel_2: 18.0
* Latitude_Of_Origin: 3.0
* Linear Unit: Meter (1.0)

#####Existing SRS Identifiers:
1. EPSG: None
2. Oracle: None
3. Esri: None
4. FME: None
5. PostGIS: None
6. SpatialReference.org: None

###Pacific Trust Territories
* Projection: Albers Equal Area
* Datum: NAD 1983
* False_Easting: 0.0
* False_Northing: 0.0
* Central_Meridian: 145.0
* Standard_Parallel_1: 8.0
* Standard_Parallel_2: 18.0
* Latitude_Of_Origin: 3.0
* Linear Unit: Meter (1.0)

#####Existing SRS Identifiers:
1. EPSG: None
2. Oracle: None
3. Esri: None
4. FME: None
5. PostGIS: None
6. SpatialReference.org: None

##Installation
Each GIS system has different requirements and instructions for installing a new coordinate reference system. Review the instructions below and then inspect the files located in the each subfolder of the repository. 

#####Oracle Spatial
Adding a [custom Oracle Spatial CRS] (https://docs.oracle.com/database/121/SPATL/sdo_cs_concepts.htm#SPATL712) requires SYS privledges on the database in question.  All custom SRIDs and custom coordinate operation identifiers should be allocated to integers above 1000000.  Overwriting or adding SRIDs or coordinate operation identifiers below 1000000 may conflict with future Oracle upgrades or complicate your ability to obtain support for what should be stock SRIDs.  You will need to decide upon the custom SRID identifier and  custom coordinate op identifiers to use in your instances.  The default values here are 1000001 through 1000005 for both and may conflict with other custom identifiers you already have.  Make sure to verify these values are free on your instance and make any needed changes as necessary.

#####Esri ArcGIS
Adding a custom ArcGIS projection to your GIS installation is fairly easy and simply requires the projection file (extension .prj) providing a unique text identifier for the projection.  From within ArcCatalog, simply right-click on the projection file and import the projection into your local ArcGIS installation.

#####Safe Software FME
Users may add custom projections to FME by [editing their MyCoordSysDefs.fme system file](http://docs.safe.com/fme/2013/html/FME_Workbench/Default.htm#About_Custom_Coordinate_Systems.htm). Afterwards restarting FME will allow users to work with all five projections.

#####PostGIS
The PostGIS coordinate reference system is located in your public.spatial_ref_sys table and as far as I can tell is a bit of free-for-all.  Custom SRIDs **should** be placed above 990000 but as long as the common EPSG is not in use, then it seems best to just use the common SRID value.  
