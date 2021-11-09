select --ACTA--
       a.acmid,
       a.acmnro,
       a.acmjuzgadoid AS COD_JUZGADO,
       a.acmlabradafchhr AS FECHA_ACTA,
       a.acmretenevehiculo AS RETIENE_VEHICULO,
       a.acmretienelicencia AS RETIENE_LICENCIA,
       a.acmconduccionriesgosa AS VIOLA_ART_81,
       null as DEJA_COPIA,
       --VEHICULO--
       a.acmdominio AS DOMINIO,
       a.acmtipovehiculo AS TIPO_VEHICULO,
       a.acmmarca AS MARCA_VEHICULO,
       a.acmcolor AS MARCA_COLOR,
       --TITULAR--
       a.acmpropietariodni AS TITULAR_DNI,
       a.acmpropietariotipodni AS TITULAR_TIPO_DOC,
       a.acmpropietarionombre AS TITULAR_NOMBRE,
       a.acmpropietarioapellido AS TITULAR_APELLIDO,
       a.acmpropietariocalle AS TITULAR_DOMICILIO,
       a.acmpropietariocallenum TITULAR_NRO_PUERTA,
       lTit.lcldescripcion AS TITULAR_LOCALIDAD_,
       dTit.dptdescripcion AS TITULAR_DEPARTAMENTO,
       pTit.pvidescripcion AS TITULAR_PROVINCIA,
       --INFRACTOR--
       a.acminfractordni AS INFRACTOR_DNI_,
       a.acminfractortipodni AS INFRACTOR_TIPO_DNI,
       a.acminfractornombre AS INFRACTOR_NOMBRE,
       a.acminfractorapellido AS APELLIDO_INFRACTOR,
       a.acminfractorcalle AS DOMICILIO_INFRACTOR,
       a.acminfractorcallenum AS INFRACTOR_NRO_PUERTA,
       lInf.lcldescripcion AS INFRACTOR_LOCALIDAD,
       dInf.dptdescripcion AS INFRACTOR_DEPARTAMENTO,
       pInf.pvidescripcion AS INFRACTOR_PROVINCIA,
       --LICENCIA--
       a.acmlicencianumero AS LICENCIA_NRO,
       a.acmlicenciacategoria AS LICENCIA_CATEGORIA,
       a.acmlicenciaprocedencia AS LICENCIA_PROCEDENCIA,
       a.acmlicenciavencimiento AS LICENCIA_VENCIMIENTO,
       --TESTIGO--
       a.acmtestigodni AS TESTIGO_DNI,
       a.acmtestigonombre || ' ' || a.acmtestigoapellido AS TESTIGO_NOMBRE_APELLIDO,
       a.acmtestigocalle || ' ' || a.acmtestigocallenro AS TESTIGO_DOMICILIO,
       --INFRACCION--
       A.Acmlat as LATITUD,
       A.ACMLONG AS LONGITUD,
       a.acminfraccionruta || ' ' || a.acminfraccionrutanum as LUGAR_INFRACCION,
       a.acmifrdeslugar as CALLE_INFRACCION,
       a.acminfraccionkm as INFRACCION_ALTURA_KM,
       a.acminfraccionreferencia as REFERENCIA_INFRACCION,
       null as DPTO_INFRACCION,
       null as LOCAL_INFRACCION,
       i.ifrcodigo as CODIGO_INFRACCION,
       t.ifrtipo AS TIPO_FALTA,
       i.ifrds AS INFRACCIONES,
       a.acmvencimientofch AS VENCIMIENTO_ACTA,
       u.usrnm AS OFICIAL_LABRADO
from vialcaminera.actacaminera a, vialcaminera.actacaminerainfracciones i, vialcaminera.usuarios_suite u,
     vialcaminera.localidades lInf, vialcaminera.departamentos_partidos dInf, vialcaminera.provincias pInf,
     vialcaminera.localidades lTit, vialcaminera.departamentos_partidos dTit, vialcaminera.provincias pTit,
     vialcaminera.infracciones t
where a.acmid = i.acmid
  and a.acmusuarioidpda = u.usrid
  and a.acminfractorlclid = lInf.lclid
  and a.acminfractordptid = lInf.dptid
  and a.acminfractorpviid = lInf.pviid
  and a.acminfractordptid = dInf.dptid
  and a.acminfractorpviid = dInf.pviid
  and a.acminfractorpviid = pInf.pviid
  and a.acmpropietariolclid = lTit.lclid
  and a.acmpropietariodptid = lTit.dptid
  and a.acmpropietariopviid = lTit.pviid
  and a.acmpropietariodptid = dTit.dptid
  and a.acmpropietariopviid = dTit.pviid
  and a.acmpropietariopviid = pTit.pviid
  and a.acmid = i.acmid
  and i.ifrid = t.ifrid
  and acmnro not like 'T%'
  order by acmid desc;
