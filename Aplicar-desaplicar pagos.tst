PL/SQL Developer Test script 3.0
13
-- Created on 11/12/2019 by USUARIO 
declare 
  -- Local variables here
  p_desc_error varchar2(100);
  p_cod_error number;
  p_rpsid number := 13532;
  --p_rrnid number := 2834;
  
begin
  --vialcaminera.pkg_pagos.DESAPLICAR_PAGO(p_rrnid, p_rpsid, user,p_cod_error,  p_desc_error);
  vialcaminera.prc_aplicar_pagos_pfp(p_rpsid, p_cod_error,  p_desc_error);
  commit;  
end;
0
0
