PL/SQL Developer Test script 3.0
14
-- Created on 28/5/2018 by MAXIMILIANO 
declare 
  -- Local variables here
  cursor c1 is select equipoimei from vialcaminera.equipo_imei e where e.equiponumerodispos = 941;
  cursor c2 is select s.sql from pivacm.sql_actualizacion s;
begin
  for c1_reg in c1 loop
    for c2_reg in c2 loop
      insert into vialcaminera.actualizacion_pda (acsql, acactuimei, acactubloqueado,acejecutado) values
      (c2_reg.sql, c1_reg.equipoimei,'N','N');
      commit;
    end loop;
  end loop;
end;
0
0
