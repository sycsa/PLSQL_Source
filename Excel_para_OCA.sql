select Nro_acta,
       v.nro_seri,
       Apellido_nombre,
       Domicilio,
       Nropuerta,
       Piso,
       Dpto,
       Departamento,
       Localidad,
       vial.pck_domicilio.Get_CP(i.in_ipro,i.lo_codi,i.dp_codi) as CP
  from vial.v_acta_resuelta v, vial.infracci i
 where v.lote = &vLote
   AND v.orden > 0
   and v.nro_acta = i.in_nroa
   and v.nro_seri = i.in_seri
 order by v.orden
