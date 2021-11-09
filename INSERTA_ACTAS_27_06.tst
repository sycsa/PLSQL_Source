PL/SQL Developer Test script 3.0
193
-- Created on 27/6/2019 by USUARIO 
declare
  -- Local variables here
  cursor c1 is
    select x.*
      from vialcaminera.logs_pda_webservice t,
           xmltable(xmlnamespaces(default 'VialMza'),
                    '/SDTActaCaminera/Acta' passing xmltype(t.pdalogrequest)
                    columns Id_Acta varchar2(15) path 'Id_Acta',
                    Nro_Acta varchar2(20) path 'Nro_Acta',
                    Letra_Serie varchar2(20) path 'Letra_Serie',
                    Infraccion_Departamento varchar2(5) path
                    'Infraccion_Departamento',
                    Infraccion_Localidad varchar2(5) path
                    'Infraccion_Localidad',
                    Infraccion_Lugar varchar2(200) path 'Infraccion_Lugar',
                    Infraccion_Numero_Ruta varchar2(20) path
                    'Infraccion_Numero_Ruta',
                    Infraccion_Descripcion_Lugar varchar2(500) path
                    'Infraccion_Descripcion_Lugar',
                    Infraccion_KmAltura varchar2(20) path
                    'Infraccion_KmAltura',
                    Infraccion_Referencia varchar2(200) path
                    'Infraccion_Referencia',
                    Fec_Hora_Labrada varchar2(20) path 'Fec_Hora_Labrada',
                    Fec_Vencimiento varchar2(20) path 'Fec_Vencimiento',
                    Retiene_Licencia varchar2(20) path 'Retiene_Licencia',
                    Retiene_Vehiculo varchar2(20) path 'Retiene_Vehiculo',
                    Deja_Copia varchar2(1) path 'Deja_Copia',
                    TipoVehiculo varchar2(50) path 'TipoVehiculo',
                    TipoPatente varchar2(20) path 'TipoPatente',
                    ConduccionPeligrosa varchar2(20) path
                    'ConduccionPeligrosa',
                    Dominio varchar2(20) path 'Dominio',
                    Marca varchar2(20) path 'Marca',
                    Color varchar2(20) path 'Color',
                    ModeloVehiculo varchar2(500) path 'ModeloVehiculo',
                    Tipo_Dni_Propietario varchar2(20) path
                    'Tipo_Dni_Propietario',
                    Dni_Propietario varchar2(20) path 'Dni_Propietario',
                    Nombre_Propietario varchar2(20) path
                    'Nombre_Propietario',
                    Apellido_Propietario varchar2(200) path
                    'Apellido_Propietario',
                    Razon_Social_Propietario varchar2(200) path
                    'Razon_Social_Propietario',
                    Calle_Propietario varchar2(20) path 'Calle_Propietario',
                    Num_Calle_Propietario varchar2(20) path
                    'Num_Calle_Propietario',
                    Piso_Propietario varchar2(5) path 'Piso_Propietario',
                    DeptoDomicilio_Propietario varchar2(5) path
                    'DeptoDomicilio_Propietario',
                    Barrio_Propietario varchar2(5) path 'Barrio_Propietario',
                    Anio varchar2(4) path 'Anio',
                    Localidad_Propietario varchar2(20) path
                    'Localidad_Propietario',
                    Depto_Propietario varchar2(20) path 'Depto_Propietario',
                    Pcia_Propietario varchar2(20) path 'Pcia_Propietario',
                    Pais_Propietario varchar2(20) path 'Pais_Propietario',
                    Tipo_Dni_Infractor varchar2(20) path
                    'Tipo_Dni_Infractor',
                    Dni_Infractor varchar2(20) path 'Dni_Infractor',
                    Nombre_Infractor varchar2(200) path 'Nombre_Infractor',
                    Apellido_Infractor varchar2(200) path
                    'Apellido_Infractor',
                    Telefono varchar2(20) path 'Telefono',
                    Email varchar2(200) path 'Email',
                    Calle_Infractor varchar2(20) path 'Calle_Infractor',
                    Num_Calle_Infractor varchar2(20) path
                    'Num_Calle_Infractor',
                    Piso_Infractor varchar2(5) path 'Piso_Infractor',
                    DeptoDomicilio_Infractor varchar2(5) path
                    'DeptoDomicilio_Infractor',
                    Barrio_Infractor varchar2(5) path 'Barrio_Infractor',
                    Localidad_Infractor varchar2(20) path
                    'Localidad_Infractor',
                    Depto_Infractor varchar2(20) path 'Depto_Infractor',
                    Pcia_Infractor varchar2(20) path 'Pcia_Infractor',
                    Pais_Infractor varchar2(20) path 'Pais_Infractor',
                    Numero_Licencia varchar2(20) path 'Numero_Licencia',
                    Categoria_Licencia varchar2(20) path
                    'Categoria_Licencia',
                    Vencimiento_Licencia varchar2(20) path
                    'Vencimiento_Licencia',
                    Procedencia_Licencia varchar2(20) path
                    'Procedencia_Licencia',
                    Tipo_Dni_Testigo varchar2(20) path 'Tipo_Dni_Testigo',
                    Dni_Testigo varchar2(20) path 'Dni_Testigo',
                    Nombre_Testigo varchar2(200) path 'Nombre_Testigo',
                    Apellido_Testigo varchar2(200) path 'Apellido_Testigo',
                    Calle_Testigo varchar2(20) path 'Calle_Testigo',
                    Calle_Nro_Testigo varchar2(20) path 'Calle_Nro_Testigo',
                    Piso_Testigo varchar2(5) path 'Piso_Testigo',
                    DeptoDomicilio_Testigo varchar2(5) path
                    'DeptoDomicilio_Testigo',
                    Barrio_Testigo varchar2(5) path 'Barrio_Testigo',
                    Localidad_Testigo varchar2(20) path 'Localidad_Testigo',
                    Depto_Testigo varchar2(20) path 'Depto_Testigo',
                    Pcia_Testigo varchar2(20) path 'Pcia_Testigo',
                    Pais_Testigo varchar2(20) path 'Pais_Testigo',
                    ManifestacionTestigo varchar2(200) path
                    'ManifestacionTestigo',
                    Observacion varchar2(200) path 'Observacion',
                    Cod1_Barra varchar2(200) path 'Cod1_Barra',
                    Cod2_Barra varchar2(200) path 'Cod2_Barra',
                    Cod1_Barra_Descuento varchar2(200) path
                    'Cod1_Barra_Descuento',
                    Cod2_Barra_Descuento varchar2(200) path
                    'Cod2_Barra_Descuento',
                    Id_Movil varchar2(20) path 'Id_Movil',
                    Id_Usuario_PDA varchar2(200) path 'Id_Usuario_PDA',
                    Lat varchar2(20) path 'Lat',
                    Lon varchar2(20) path 'Lon',
                    imei varchar2(20) path 'imei',
                    Juzgado varchar2(200) path 'Juzgado',
                    Juzgado_Calle varchar2(200) path 'Juzgado_Calle',
                    Juzgado_Numero varchar2(200) path 'Juzgado_Numero',
                    Juzgado_Localidad varchar2(200) path 'Juzgado_Localidad',
                    Juzgado_CP varchar2(20) path 'Juzgado_CP',
                    Id_Seccional varchar2(5) path 'Id_Seccional',
                    InfCod1 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[1]',
                    InfDes1 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[1]',
                    InfCod2 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[2]',
                    InfDes2 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[2]',
                    InfCod3 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[3]',
                    InfDes3 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[3]',
                    InfCod4 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[4]',
                    InfDes4 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[4]',
                    InfCod5 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[5]',
                    InfDes5 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[5]',
                    InfCod6 varchar2(20) path
                    'Infracciones/Infraccion/Codigo[6]',
                    InfDes6 varchar2(20) path
                    'Infracciones/Infraccion/Descripcion[6]') x
    
     where t.pdalogid = &PDALOGID;
begin
  for c1_reg in c1 loop
  insert into vialcaminera.actacaminera
    (acmnro, ACMINFRACCIONRUTA, ACMINFRACCIONRUTANUM, ACMINFRACCIONKM, ACMLABRADAFCHHR, ACMVENCIMIENTOFCH,
     ACMRETIENELICENCIA, ACMRETENEVEHICULO, ACMDOMINIO,
     ACMMARCA, ACMCOLOR, ACMPROPIETARIOTIPODNI, ACMPROPIETARIODNI,
     ACMPROPIETARIONOMBRE, ACMPROPIETARIOAPELLIDO, ACMPROPIETARIOCALLE,
     ACMPROPIETARIOCALLENUM, ACMINFRACTORTIPODNI, ACMINFRACTORDNI, ACMINFRACTORNOMBRE,
     ACMINFRACTORAPELLIDO, ACMINFRACTORCALLE, ACMINFRACTORCALLENUM, ACMLICENCIANUMERO,
     ACMLICENCIACATEGORIA, ACMLICENCIAVENCIMIENTO, ACMLICENCIAPROCEDENCIA, ACMTESTIGOTIPODNI, ACMTESTIGODNI,
     ACMTESTIGONOMBRE, ACMTESTIGOAPELLIDO, ACMTESTIGOCALLE, ACMTESTIGOCALLENRO, ACMOBSERVACIONES, CODBARRA1,
     CODBARRA2, CODBARRA1DESCUENTO, CODBARRA2DESCUENTO, ACMJUZGADO, ACMJUZGADOCALLE, ACMJUSGADOLOCALIDAD,
     ACMJUZGADOCP, ACMMOVILID, ACMUSUARIOIDPDA, ACMLAT, ACMLONG, ACMIMEI, ACMJUZGADOCALLENUMERO,
     ACMJUZGADOID, ACMANIO, ACMSERIE, ACMNUMERO, ACMCONDUCCIONRIESGOSA, ACMINFRACCIONCALLE, ACMPROPIETARIOPASID,
     ACMPROPIETARIOPVIID, ACMPROPIETARIODPTID, ACMPROPIETARIOLCLID, ACMINFRACTORPASID, ACMINFRACTORPVIID,
     ACMINFRACTORDPTID, ACMINFRACTORLCLID, ACMTESTIGOPASID, ACMTESTIGOPVIID, ACMTESTIGODPTID,
     ACMTESTIGOLCLID, ACMINFRACCIONPASID, ACMINFRACCIONPVIID, ACMINFRACCIONDPTID, ACMINFRACCIONLCLID,
     ACMUF, ACMOFICIALLABRADO,  ACMTIPOVEHICULO, ACMUNCID, ACMINFRACCIONREFERENCIA, ACMFECHASYNC,
     ACMIFRDESLUGAR, ACMDEJACOPIA, ACMINFRACTOREMAIL, ACMINFRACTORTELEFONO, ACMMANIFESTACIONTESTIGO,
     ACMBARRIOPROPIETARIO, ACMPISOPROPIETARIO, ACMBARRIOINFRACTOR, ACMPISOINFRACTOR, ACMBARRIOTESTIGO,
     ACMPISOTESTIGO, ACMDEPTOPROPIETARIO, ACMDEPTOINFRACTOR, ACMDEPTOTESTIGO)
  values
    (c1_reg.letra_serie||c1_reg.id_acta, c1_reg.Infraccion_Lugar,c1_reg.Infraccion_Numero_Ruta,
     c1_reg.Infraccion_KmAltura, c1_reg.Fec_Hora_Labrada, c1_reg.Fec_Vencimiento, c1_reg.Retiene_Licencia,
     c1_reg.Retiene_Vehiculo, c1_reg.Tipopatente, c1_reg.marca, c1_reg.color, c1_reg.Tipo_Dni_Propietario,
     c1_reg.Dni_Propietario, c1_reg.Nombre_Propietario, c1_reg.Apellido_Propietario, c1_reg.Calle_Propietario,
     c1_reg.Num_Calle_Propietario, c1_reg.Tipo_Dni_Infractor, c1_reg.Dni_Infractor, c1_reg.Nombre_Infractor,
     c1_reg.Apellido_Infractor, c1_reg.calle_infractor, c1_reg.num_calle_infractor, c1_reg.numero_licencia,
     c1_reg.categoria_licencia, c1_reg.vencimiento_licencia, c1_reg.procedencia_licencia,
     c1_reg.tipo_dni_testigo, c1_reg.dni_testigo, c1_reg.nombre_testigo, c1_reg.apellido_testigo,
     c1_reg.calle_testigo, c1_reg.calle_nro_testigo, c1_reg.observacion, c1_reg.cod1_barra, c1_reg.cod2_barra, 
     c1_reg.cod1_barra_descuento, c1_reg.cod2_barra_descuento,
     (select JZGVDESCRIPCION from vialcaminera.juzgadosviales where JZGVID = c1_reg.juzgado), 
     c1_reg.juzgado_calle, c1_reg.juzgado_localidad, c1_reg.juzgado_cp, c1_reg.id_movil, c1_reg.id_usuario_pda, 
     c1_reg.lat, c1_reg.lon, c1_reg.imei, c1_reg.juzgado_numero, c1_reg.juzgado, c1_reg.anio, c1_reg.letra_serie, c1_reg.id_acta, 
     c1_reg.conduccionpeligrosa, c1_reg.Infraccion_Descripcion_Lugar, c1_reg.pais_propietario,
     c1_reg.pcia_propietario,  c1_reg.depto_propietario, c1_reg.localidad_propietario,c1_reg.pais_infractor, c1_reg.pcia_infractor,
     c1_reg.depto_infractor, c1_reg.localidad_infractor, c1_reg.pais_testigo, c1_reg.pcia_testigo, 
     c1_reg.depto_testigo, c1_reg.localidad_testigo, 1, 13, c1_reg.infraccion_departamento, c1_reg.infraccion_localidad,
     null, (select usrnm from vialcaminera.usuarios_suite where usrid = c1_reg.id_usuario_pda), c1_reg.tipovehiculo,
     c1_reg.id_seccional, c1_reg.infraccion_referencia, sysdate, c1_reg.infraccion_descripcion_lugar, c1_reg.deja_copia,
     c1_reg.email, c1_reg.telefono, c1_reg.manifestaciontestigo, c1_reg.barrio_propietario, c1_reg.piso_propietario,
     c1_reg.barrio_infractor, c1_reg.piso_infractor, c1_reg.barrio_testigo, c1_reg.piso_infractor,
     c1_reg.deptodomicilio_propietario, c1_reg.deptodomicilio_infractor, c1_reg.deptodomicilio_testigo)
     )
  end loop;
end;
0
0
