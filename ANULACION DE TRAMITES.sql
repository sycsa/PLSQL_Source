--anulación del tramite seleccionado
update vialcaminera.concontacto set coned = 'ANU' where conid = 3096641;

--anulación del movimiento generado por la cuenta corriente
update vialcaminera.cuenta_corriente
   set ccefechabaja = sysdate
 where cceorigen = 3096641;

--actualizar el monto que figura en las obligaciones
update vialcaminera.obligaciones
   set obnsaldoposicion =
       (select sum(cceimporte)
          from vialcaminera.cuenta_corriente
         where vialcaminera.to_null(ccefechabaja) is null
           and obnid =
               (select obnid
                  from vialcaminera.cuenta_corriente
                 where cceorigen = 3096641))
 where obnid = (select obnid
                  from vialcaminera.cuenta_corriente
                 where cceorigen = 3096641);

commit;
