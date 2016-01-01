/* PL/SQL block to execute on your system with SYS privledges in order to install support for the USGS Albers Equal Area Conic projection 
for Hawaii.

Paste this script into Oracle and adjust the custom identifiers as needed for your system.  This script 
uses custom srid 1000002 and custom coordinate operation id 1000002 as defaults.  Alter them if needed.

*/

DECLARE
   -- Adjust the following two values as neeeded
   int_custom_srid INTEGER := 1000002;
   int_custom_opid INTEGER := 1000002;
   -- 
BEGIN
   -- First load the new coordinate operation
   INSERT INTO MDSYS.SDO_COORD_OPS(
       coord_op_id
      ,coord_op_name
      ,coord_op_type
      ,coord_op_method_id
      ,data_source
      ,show_operation
      ,is_legacy
      ,reverse_op
      ,is_implemented_forward
      ,is_implemented_reverse
   ) VALUES (
       int_custom_opid
      ,'NAD83 Hawaii Albers Equal Area USGS'
      ,'CONVERSION'
      ,9822
      ,'DZ'
      ,1
      ,'FALSE'
      ,1
      ,1
      ,1
   );
   -- Second load the coordinate operation values
   INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8821
      ,3
      ,9102
    );
    INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8822
      ,-157
      ,9102
   );
   INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8823
      ,8
      ,9110
   );
   INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8824
      ,18
      ,9110
   );
   INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8826
      ,0
      ,9001
   );
   INSERT INTO MDSYS.SDO_COORD_OP_PARAM_VALS(
       coord_op_id
      ,coord_op_method_id
      ,parameter_id
      ,parameter_value
      ,uom_id
   ) VALUES (
       int_custom_opid
      ,9822
      ,8827
      ,0
      ,9001
   );
   -- Third insert the custom projections into SDO_COORD_REF_SYSTEM
   -- Note the insertion takes place in the associated view and NOT in the table (SDO_COORD_REF_SYS).
   -- This allows the view trigger to populate the SDO_COORD_REF_SYS table automatically.
   INSERT INTO MDSYS.SDO_COORD_REF_SYSTEM(
       srid
      ,coord_ref_sys_name
      ,coord_ref_sys_kind
      ,coord_sys_id
      ,geog_crs_datum_id
      ,source_geog_srid
      ,projection_conv_id
      ,information_source
      ,is_legacy
      ,legacy_wktext
      ,is_valid
      ,supports_sdo_geometry
   ) VALUES (
       int_custom_srid
      ,'NAD83 Hawaii Albers Equal Area USGS'
      ,'PROJECTED'
      ,4400
      ,20006
      ,2000006
      ,int_custom_opid
      ,'DZ'
      ,'TRUE'
      ,'PROJCS["NAD83 Hawaii Albers Equal Area USGS",GEOGCS["NAD 83",DATUM["NAD 83",SPHEROID["GRS 80",6378137,298.2572221010002]],PRIMEM["Greenwich",0],UNIT["Decimal Degree",0.0174532925199433]],PROJECTION["Albers Conical Equal Area"],PARAMETER["False_Easting",0.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-157.0],PARAMETER["Standard_Parallel_1",8],PARAMETER["Standard_Parallel_2",18],PARAMETER["Latitude_Of_Origin",3.0],UNIT["Meter",1.0]]'
      ,'TRUE'
      ,'TRUE'
   );
   -- Done
   COMMIT;
   --
END;
/

