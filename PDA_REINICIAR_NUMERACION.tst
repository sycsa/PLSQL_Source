PL/SQL Developer Test script 3.0
9
declare 
  cursor c1 is select e.equipoimei from vialcaminera.equipo_imei e where e.equipodelegacion = 'UNIDADES DE RESOLUCIONES VIALES ZONA SUR';
begin
  for c1_reg in c1 loop
    update vialcaminera.equipo_imei e
    set e.equiponumeroacta = e.equiponumeroacta - substr(to_char(e.equiponumeroacta),5,3);
    commit;
  end loop;
end;
0
0
