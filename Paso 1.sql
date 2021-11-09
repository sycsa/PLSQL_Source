select Nro_acta,
       v.nro_seri,
       Apellido_nombre,
       Domicilio,
       Nropuerta,
       Piso,
       Dpto,
       Departamento,
       Localidad,
       Provincia as CP
  from vial.v_acta_resuelta v
 where v.lote = &vLote
 order by v.orden
