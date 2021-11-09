Insert into vialcaminera.actualizacion_pda
  select 0 as ACACTUID,
         'update t_infracciones_nomencladas set descripcion=' || chr(39) ||
         t.descripcion || chr(39) || ',descripcion_corta=' || chr(39) ||
         t.descripcion || chr(39) || ',COSTO_ASOCIADO=' || costo_asociado ||
         ', TIPO_FALTA=' || chr(39) || tipo_falta || chr(39) ||
         ',retiene_licencia=' || chr(39) || retiene_licencia || chr(39) ||
         ', Secuestra_vehiculo=' || chr(39) || Secuestra_vehiculo ||
         chr(39) || ' where codigo=' || codigo || ';' as ACsql,
         null as fecha_vigencia,
         '&IMEI' as IMEI,
         'N' Bloqueado,
         'N' as Ejecutar
    from NOMENCLADOR_9024 t;
commit;
