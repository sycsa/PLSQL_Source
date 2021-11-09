PL/SQL Developer Test script 3.0
20
-- Created on 7/3/2019 by USUARIO 
declare
  -- Local variables here
  cursor c1 is
    select acmnro, acmoficiallabrado, acmusuarioidpda
      from vialcaminera.actacaminera
     where acmoficiallabrado is not null
       and acmusuarioidpda is not null;
  i integer;
begin
  i:= 0;
  for c1_reg in c1 loop
    update vialcaminera.objeto_datos_descriptivos o
       set o.oddcaracter12 = c1_reg.acmusuarioidpda,
           o.oddcaracter18 = c1_reg.acmoficiallabrado
     where o.ojtid = (select ojtid from vialcaminera.objetos oj where oj.ojtidentificador1 = c1_reg.acmnro);
     i:= i+1;
  end loop;
  dbms_output.put_line(i);
end;
0
0
