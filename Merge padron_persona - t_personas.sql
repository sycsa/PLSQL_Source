Merge into pivacm.t_personas p
using (select * from vial.padron_automotor a
where rowid = (select Max(rowid) 
               from vial.padron_automotor b 
               where a.tipo_documento = b.tipo_documento 
               and a.numero_documento = b.numero_documento)) pa
on (pa.TIPO_DOCUMENTO = p.id_tipo_documento and pa.numero_documento = p.numero_Documento)
when matched then
  update
     Set p.apellido      = regexp_substr(pa.nombre, '(\S*)', 1, 1),
         p.nombre        = substr(pa.nombre, instr(pa.nombre, ' ', 1,1) + 1, length(pa.nombre)),
         p.calle         = pck_padron_auto.getCalle(pa.calle),
         p.altura        = pck_padron_auto.getAltura(pa.calle),
         p.piso          = pck_padron_auto.getPiso(pa.calle),
         p.depto         = pck_padron_auto.getDepto(pa.calle),
         p.provincia     = pck_padron_auto.getProvincia(pa.calle),
         p.departamento  = pck_padron_auto.getDepartamento(pa.calle),
         p.localidad     = pck_padron_auto.get_Localidad(pa.calle)
when not matched then
  insert
    (p.id_tipo_documento,
     p.numero_documento,
     p.apellido,
     p.nombre,
     p.calle,
     p.altura,
     p.piso,
     p.depto,
     p.provincia,
     p.departamento,
     p.localidad)
  values
    (pa.tipo_documento,
     pa.numero_documento,
     regexp_substr(pa.nombre, '(\S*)', 1, 1),
     substr(pa.nombre, instr(pa.nombre, ' ', 1,1) + 1, length(pa.nombre)),
     pck_padron_auto.getCalle(pa.calle),
     pck_padron_auto.getAltura(pa.calle),
     pck_padron_auto.getPiso(pa.calle),
     pck_padron_auto.getDepto(pa.calle),
     pck_padron_auto.getProvincia(pa.calle),
     pck_padron_auto.getDepartamento(pa.calle),
     pck_padron_auto.get_Localidad(pa.calle));
commit;
