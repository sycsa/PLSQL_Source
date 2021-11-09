insert into vialcaminera.actualizacion_pda
  (acsql, acactuimei, acactubloqueado, acejecutado)
values
  ('update t_acta_constatacion set dominio = "SKU950" where numero_acta = "X0004001939"',
   (select equipoimei from vialcaminera.equipo_imei where
   equiponumeroacta like '400%'),
   'N',
   'N');
commit;
