insert into vialcaminera.actualizacion_pda
select 0 ,
 'delete from t_seccional;' as ACSQL, 
         null as fecha_vigencia,
         '&IMEI' as IMEI,
         'N' Bloqueado,
         'N' as Ejecutar from dual
union all
select 0,'insert into t_seccional ( _id,nombre,descripcion) values ('||it_codi||','||chr(39)||it_desc||chr(39)||','
||chr(39)||it_desc||chr(39)||');' as ACSQL,
         null as fecha_vigencia,
         '&IMEI' as IMEI,
         'N' Bloqueado,
         'N' as Ejecutar
 from vial.instituc WHERE IT_CODI IN 
(1,2,3,4,5,6,7,9,10,11,16,17,23,25,27,29,30,31,33,34,35,36,37,40,43,47,49,56,103,105,106,107,108,109,116,117,120,121,122,127,523,700,702)
