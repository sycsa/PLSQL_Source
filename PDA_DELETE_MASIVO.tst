PL/SQL Developer Test script 3.0
10
-- Created on 24/5/2018 by MAXIMILIANO 
declare 
  cursor c1 is select e.equipoimei from vialcaminera.equipo_imei e where e.equiponumerodispos >940;
begin
  for c1_reg in c1 loop
    insert into vialcaminera.actualizacion_pda (acsql, acactuimei, acactubloqueado, acejecutado) values
    ('delete from t_seccional', c1_reg.equipoimei, 'N', 'N');
    commit;
  end loop;
end;
0
0
