PL/SQL Developer Test script 3.0
36
-- Created on 5/1/2021 by USUARIO 
declare
  -- Local variables here
  cursor c1 is
    select e.equipoimei
      from vialcaminera.equipo_imei e
     where e.equiponumerodispos = 919;
  cursor c2 is
    select to_char(n.nlsfecha, 'YYYYMMDD') AS fecha,
           n.nlsfecha as fecha_string,
           'FERIADO' as tipo,
           n.nlsdescripcion as DESCRIPCION
      from vialcaminera.no_laborables n
     where nlsfecha >= sysdate;
  i integer;
begin
  for c1_reg in c1 loop
    i := 181;
    for c2_reg in c2 loop
      insert into vialcaminera.actualizacion_pda
        (acsql, acactuimei, acactubloqueado, acejecutado)
      values
        ('insert into `T_FECHAS_CONFIGURADAS` (_id, fecha, fecha_string, tipo, descripcion) values ('
        || i || ','
        || chr(39) || c2_reg.fecha || chr(39) || ','
        || chr(39) || c2_reg.fecha_string || chr(39) ||  ','
        || chr(39) || 'FERIADO' || chr(39) ||  ','
        || chr(39) || c2_reg.descripcion || chr(39) ||  ')',
         c1_reg.equipoimei,
         'N',
         'N');
      i := i + 1;
    end loop;
  end loop;

end;
0
0
