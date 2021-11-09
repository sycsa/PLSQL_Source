select v.lote,
       v.nro_acta,
       v.nro_seri,
       s.sppdni,
       s.sppapellido,
       s.sppnombre,
       s.spptel,
       s.sppemail,
       s.sppdomicilio,
       v.localidad,
       v.departamento,
       s.sppfch,
       v.cant_cuota
  from vial.v_acta_resuelta v, vialmendoza.solicitud_plan_pago s
 where v.ojtid = s.ojtid
 order by s.sppfch desc
