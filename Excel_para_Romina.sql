select v.lote,
       v.orden,
       v.resoluci,
       i.in_fech,
       i.in_nroa,
       i.in_seri,
       i.in_apel || ', ' || i.in_nomb as APELLIDO_NOMBRE_INFRACTOR,
       i.in_idom AS DOMICILIO_INFRAC,
       i.in_idnr AS NRO_PUERTA,
       i.in_idpi AS PISO,
       i.in_iddp AS DPTO,
       v.departamento,
       v.localidad,
       v.tipodocumento,
       v.nrodocumento,
       v.fechainfraccion,
       v.marca_vehiculo,
       v.modelo_vehiculo,
       v.dominio_vehiculo,
       v.lugar_infraccion,
       v.localidad_infraccion,
       v.infraccion,
       v.fecha_infraccion,
       v.juzgado,
       v.cod_juzgado,
       r.re_touf,
       r.re_mont,
       to_number(r.uf_valor),
       v.dpto_infraccion,
       regexp_substr(vial.pck_planes.Cuotas_disponibles(v.nro_seri,
                                                        v.nro_acta),
                     '\d{1,}') as CUOTAS_DISPONIBLES,
       UPPER(t.descripcion),
       v.respuesta,
       (case
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like 'E%' then
          'EXCEPCION POR LEY'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like 'J%' then
          'OTORGADO POR RESOLUCION'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like 'C%' then
          'SIMULADO'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like
              'H-0' then
          'MONTO INSUFICIENTE'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like
              'P-0' then
          'ABSUELTA'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like
              'H-3' then
          'APLICA PARA PLAN'
         when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like '--' then
          'SIN DETERMINAR'
       
       end) as DETERMINADO_POR,
       (case when vial.pck_planes.Cuotas_disponibles(v.nro_seri, v.nro_acta) like
        'P-0' then 0 else vial.pck_planes.get_Cuota(v.nro_seri, v.nro_acta)end) as CUOTAS
  from vial.v_acta_resuelta v,
       vial.infracci        i,
       vial.tipo_falta      t,
       vial.resoluci        r
 where v.nro_acta = i.in_nroa
   and v.nro_seri = i.in_seri
   and v.nro_acta = r.in_nroa
   and v.nro_seri = r.in_seri
   and i.tf_codi = t.tf_codi
 order by lote, ltrim(apellido_nombre) asc
