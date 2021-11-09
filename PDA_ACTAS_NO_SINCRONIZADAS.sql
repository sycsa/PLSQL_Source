select l.pdaacmnro, l.pdaerror, count(l.pdaacmnro)
  from vialcaminera.logs_pda_webservice l
 where l.pdaacmnro like 'X%'
   and l.pdaerror = 'S'
   and pdaacmnro not in (select pdaacmnro
                          from vialcaminera.logs_pda_webservice
                          where pdaerror = 'N'
                           and pdaacmnro like 'X%'
                           group by pdaacmnro)
 group by l.pdaacmnro, l.pdaerror
having count(l.pdaacmnro) > 1
 order by l.pdaacmnro;
