select p.tpo_vehic,
       dominio,
       Substr(Marca, 1, Instr(marca, ' ') - 1) as marca,
       Substr(Marca, Instr(Marca, ' ') + 1,length(marca)) as Modelo,
       P.ANIO,
       p.cuit,
       Substr(Nombre, 1, Instr(Nombre, ' ') - 1) as Apellido,
       Trim(Substr(Nombre, Instr(Nombre, ' ') + 1,length(Nombre))) as Nombres,
       getcalle(domicilio) as calle,
       getAltura(domicilio) as ALTURA,
       getpiso(domicilio) as PISO,
       getdepto(domicilio) as DPTO,
       getmzna(domicilio) as MANZANA,
       getcasa(domicilio) as CASA,
       get_localidad(domicilio) as Localidad,
       getDepartamento(domicilio) as DEPARTAMENTO,
       getCodPostal(domicilio) as COD_POSTAL,
       getProvincia(domicilio) as PROVINCIA
       
  from vial.padron_automotor p
  
