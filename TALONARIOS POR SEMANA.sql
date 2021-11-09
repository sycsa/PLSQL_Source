select u.uncnm,TRUNC(t.tacentregafch, 'iw')
  from vialcaminera.talonarioacta t, vialcaminera.unidadcontrol u
 where tacentregafch between '01/01/2018' and trunc(sysdate)
   and t.uncid = u.uncid(+)
 group by u.uncnm, TRUNC(t.tacentregafch, 'iw')
 order by uncnm;
 
 -----------------------------------------------------------------------------
 
select u.uncnm,TRUNC(t.tacentregafch, 'iw')
  from vialcaminera.talonarioacta t, vialcaminera.unidadcontrol u
 where tacentregafch between '01/01/2018' and trunc(sysdate)
   and t.uncid = u.uncid(+)
 group by u.uncnm, TRUNC(t.tacentregafch, 'iw')
 order by uncnm;
