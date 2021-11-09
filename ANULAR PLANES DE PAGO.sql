select * from vialcaminera.formas_pago where fpoid = 55349 for update; --- pasar a EFPID = CONF

select *
  from vialcaminera.cuenta_corriente
 where obnid = '14913355797302'
 order by cceid
   for update; -- quitar la baja de todos los movimientos , eliminar  los movimientos desde el cceid > 2896940

select *
  from vialcaminera.obligaciones
 where obnid = '14913355797302'
   for update; -- poner en cero el  OBNSALDOPOSICION

select *
  from vialcaminera.obligaciones_situaciones
 where obnid = '14913355797302'
   for update; -- poner en  OSSSITPLANPAGO = 1
