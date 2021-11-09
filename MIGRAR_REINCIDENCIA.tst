PL/SQL Developer Test script 3.0
22
-- Created on 20/12/2018 by USUARIO 
declare
  -- Local variables here
  cursor c1 is
    select * from vial.inhabili where NO_NREGI = '12246668';
begin
  for c1_reg in c1 loop
    insert into vial.h_antecedente
      (tipo, objeto, descripcion, TPA, motivo, fecmov, institucion, nro_resoluc,habilitada, extracto)
    values
      ('PE',
       c1_reg.ih_ndoc,
       c1_reg.ih_nomb || ' ' || c1_reg.ih_apel,
       'IN',
       UPPER(c1_reg.ih_caus),
       sysdate,
       c1_reg.ih_juei,
       c1_reg.re_nror||'/'||c1_reg.in_anre,
       'N',
       c1_reg.ih_desi01);
  end loop;
end;
0
0
