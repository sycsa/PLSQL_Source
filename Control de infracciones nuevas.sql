select *
  from vialcaminera.objetos o, vialcaminera.objeto_infracciones i
 where o.ojtid in (select ojtid
                   from vialcaminera.obligaciones
                  where obnsaldoposicion = 0
                    and obnimportecalculado = 0
                    and obnperiodo = '2019'
                    and obnusuariobaja is null)
   and o.ojtid = i.ojtid
   --and i.ifrid in (select ifrid from vialcaminera.infracciones where ifrds like 'Adelant%');
