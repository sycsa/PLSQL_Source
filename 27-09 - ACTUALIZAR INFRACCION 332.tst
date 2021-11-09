PL/SQL Developer Test script 3.0
46
-- Created on 7/5/2018 by MPIVAC 
declare 
  cursor c1 is select e.equipoimei from vialcaminera.equipo_imei e where e.equiponumerodispos = 7000;
  cursor c2 is select * from vialcaminera.infracciones i where i.ifrid = 332;
  --NOTA: Cursor C2 -> ifrid < 150 = viejo nomenclador
  --                   ifrid > 150 = nuevo nomenclador
begin
  for c2_reg in c2 loop
    for c1_reg in c1 loop
        insert into vialcaminera.actualizacion_pda
        (acsql, acactuimei, acactubloqueado, acejecutado)
      values(
        'DELETE FROM `T_INFRACCIONES_NOMENCLADAS` WHERE _ID = ' || chr(39) || c2_reg.ifrid || chr(39) || ');',
         c1_reg.equipoimei,
         'N',
         'N');
         insert into vialcaminera.actualizacion_pda
        (acsql, acactuimei, acactubloqueado, acejecutado)
      values(
        'INSERT INTO `T_INFRACCIONES_NOMENCLADAS` (_id, codigo, DESCRIPCION, ESTADO, ID_GRUPO_INFRACCION, COSTO_ASOCIADO, DESCRIPCION_CORTA, TIPO_INFRACCION_ID,PUNTOS, ARTICULO, INCISO, DECRETO, LEY7680, TIPO_FALTA, CODIGO_GRUPO_NOMENCLADOR, RETIENE_LICENCIA, SECUESTRA_VEHICULO, OMITIR_CODBARR) VALUES
        ('|| c2_reg.ifrid || ',' ||chr(39) 
          || c2_reg.ifrid || chr(39) || ',' ||chr(39) 
          || c2_reg.ifrds || chr(39) || ',' ||chr(39)
          || 'A' || chr(39) || ','
          || c2_reg.griid || ',' 
          || c2_reg.ifrcosto ||',' ||chr(39) 
          || c2_reg.ifrds || chr(39) ||','
          || 1 || ',' 
          || 0 || ',' ||chr(39) 
          || c2_reg.ifrarticulo || chr(39) ||','||chr(39) 
          || c2_reg.ifrinciso || chr(39) ||','||chr(39)
          || c2_reg.ifrdecreto || chr(39) ||','||chr(39)
          || c2_reg.ifrley || chr(39) ||','||chr(39) 
          || c2_reg.ifrtipo || chr(39) || ',' ||chr(39)
          || c2_reg.ifrcodigo || chr(39) ||',' ||chr(39)
          || c2_reg.ifrretienelicencia || chr(39) || ',' ||chr(39)
          || c2_reg.ifrretienevehiculo || chr(39) || ',' ||chr(39)
          || 'N' || chr(39) ||
          ');',
         c1_reg.equipoimei,
         'N',
         'N');
      COMMIT;
    end loop;
  end loop;
end;
0
0
