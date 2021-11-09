PL/SQL Developer Test script 3.0
23
-- Created on 7/5/2018 by MPIVAC 
declare 
  cursor c1 is select e.equipoimei from vialcaminera.equipo_imei e where e.equiponumerodispos = 111;
  cursor c2 is select * from vialcaminera.infracciones i WHERE i.ifrid = 334;
begin
  for c2_reg in c2 loop
    for c1_reg in c1 loop
        insert into vialcaminera.actualizacion_pda
        (acsql, acactuimei, acactubloqueado, acejecutado)
      values
        ('update t_infracciones_nomencladas 
         set descripcion=' || chr(39) || c2_reg.ifrds || chr(39) || 
        ',descripcion_corta=' || chr(39) || c2_reg.ifrds || chr(39) || 
        ',COSTO_ASOCIADO=' || c2_reg.ifrcosto ||
        ', TIPO_FALTA=' || chr(39) || c2_reg.ifrtipo || chr(39) ||
        ' where codigo=' || c2_reg.ifrid || ';',
         c1_reg.equipoimei,
         'N',
         'N');
      COMMIT;
    end loop;
  end loop;
end;
0
0
