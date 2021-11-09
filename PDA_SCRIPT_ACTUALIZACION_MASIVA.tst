PL/SQL Developer Test script 3.0
12
declare 
  cursor c1 is select s.sql from pivacm.sql_actualizacion s;
  cursor c2 is select e.equipoimei from vialcaminera.equipo_imei e;
begin
  for c2_reg in c2 loop
    for c1_reg in c1 loop
      insert into vialcaminera.actualizacion_pda(acsql, acactuimei, acactubloqueado, acejecutado) values
      (c1_reg.sql, c2_reg.equipoimei, 'N', 'N');
      commit;
    end loop;
  end loop;
end;
0
0
