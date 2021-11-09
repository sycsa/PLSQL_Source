select --ACTA--
       a.acmnro AS NRO_ACTA,
       a.acmjuzgadoid AS COD_JUZGADO,
       a.acmlabradafchhr AS FECHA_ACTA,
       a.acmretenevehiculo AS RETIENE_VEHICULO,
       a.acmretienelicencia AS RETIENE_LICENCIA,
       CASE a.acmconduccionriesgosa when 0 then 'N' else 'S' end AS VIOLA_ART_81,
       acmdejacopia as DEJA_COPIA,
       --VEHICULO--
       a.acmdominio AS DOMINIO,
       a.acmanio as AÑO,
       a.acmtipovehiculo AS TIPO_VEHICULO,
       replace(vial.pck_apex_utils.corregirCaractAPEX(acmmarca), ' null', '') AS MARCA_VEHICULO,
       vial.pck_apex_utils.corregirCaractAPEX(a.acmcolor) AS MARCA_COLOR,
       --TITULAR--
       a.acmpropietariodni AS TITULAR_DNI,
       a.acmpropietariotipodni AS TITULAR_TIPO_DOC,
       vial.pck_apex_utils.corregircaractapex(a.acmpropietarionombre) AS TITULAR_NOMBRE,
       vial.pck_apex_utils.corregircaractapex(a.acmpropietarioapellido) AS TITULAR_APELLIDO,
       vial.pck_apex_utils.corregircaractapex(acmpropietariocalle) AS TITULAR_DOMICILIO,
       a.acmpropietariocallenum TITULAR_NRO_PUERTA,
       case nvl(lTit.lcldescripcion,'XXX') when 'XXX' then upper(a.ACMLCLNONOMPROPIETARIO) else upper(lTit.lcldescripcion) end AS PROPIETARIO_LOCALIDAD,
       case nvl(dTit.dptdescripcion,'XXX') when 'XXX' then upper(a.ACMDPTONONOMPROPIETARIO) else upper(dTit.dptdescripcion) end AS INFRACTOR_DEPARTAMENTO,
       case nvl(pTit.pvidescripcion,'XXX') when 'XXX' then upper(a.ACMPCIANONOMPROPIETARIO) else upper(pTit.pvidescripcion) end AS INFRACTOR_PROVINCIA,
       --Infraccion--
       vial.pck_apex_utils.corregirCaractAPEX(a.acminfraccionruta || ' ' || a.acminfraccionrutanum) as LUGAR_INFRACCION,
       a.acmifrdeslugar as CALLE_INFRACCION,
       a.acminfraccionkm as INFRACCION_ALTURA_KM,
       a.acminfraccionreferencia as REFERENCIA_INFRACCION,
       dLug.dptdescripcion as DPTO_INFRACCION,
       lLug.lcldescripcion as LOCAL_INFRACCION,
       vial.pck_infracci.Get_infracciones(a.acmid),
       ltrim(substr(a.codbarra2, 11,4), '0') as MONTO_TOTAL,
       a.acmobservaciones as OBSERVACIONES,
       --Infractor/Licencia--
       a.acminfractordni AS INFRACTOR_DNI_,
       a.acminfractortipodni AS INFRACTOR_TIPO_DNI,
       vial.pck_apex_utils.corregircaractapex(a.acminfractornombre) AS INFRACTOR_NOMBRE,
       vial.pck_apex_utils.corregircaractapex(a.acminfractorapellido) AS APELLIDO_INFRACTOR,
       vial.pck_apex_utils.corregircaractapex(a.acminfractorcalle) AS DOMICILIO_INFRACTOR,
       a.acminfractorcallenum AS INFRACTOR_NRO_PUERTA,
       case nvl(lInf.lcldescripcion,'XXX') when 'XXX' then upper(a.ACMLCLNONOMINFRACTOR) else upper(lInf.lcldescripcion) end AS INFRACTOR_LOCALIDAD,
       case nvl(dInf.dptdescripcion,'XXX') when 'XXX' then upper(a.ACMDPTONONOMINFRACTOR) else upper(dInf.dptdescripcion) end AS INFRACTOR_DEPARTAMETO,
       case nvl(pInf.pvidescripcion,'XXX') when 'XXX' then upper(a.ACMPCIANONOMINFRACTOR) else upper(pInf.pvidescripcion) end AS INFRACTOR_PROVINCIA,
       a.acmlicencianumero AS LICENCIA_NRO,
       a.acmlicenciacategoria AS LICENCIA_CATEGORIA,
       replace(a.acmlicenciaprocedencia, 'null null', '') AS LICENCIA_PROCEDENCIA,
       case
         when a.acmlicenciavencimiento ='31/12/1969' then null
         else a.acmlicenciavencimiento end AS LICENCIA_VENCIMIENTO,
       a.acmtestigodni AS TESTIGO_DNI,
       vial.pck_apex_utils.corregirCaractAPEX(a.acmtestigonombre || ' ' || a.acmtestigoapellido) AS TESTIGO_NOMBRE_APELLIDO,
       vial.pck_apex_utils.corregirCaractAPEX(a.acmtestigocalle || ' ' || a.acmtestigocallenro) AS TESTIGO_DOMICILIO,
       case nvl(lTes.lcldescripcion,'XXX') when 'XXX' then upper(a.ACMLCLNONOMTESTIGO) else upper(lTes.lcldescripcion) end AS INFRACTOR_LOCALIDAD,
       case nvl(dTes.dptdescripcion,'XXX') when 'XXX' then upper(a.ACMDPTONONOMTESTIGO) else upper(dTes.dptdescripcion) end AS INFRACTOR_DEPARTAMENTO,
       case nvl(pTes.pvidescripcion,'XXX') when 'XXX' then upper(a.ACMPCIANONOMTESTIGO) else upper(pTes.pvidescripcion) end AS INFRACTOR_PROVINCIA,
       a.acmuncid as COMISARIA,
       a.acmvencimientofch AS VENCIMIENTO_ACTA,
       u.usrnm AS OFICIAL_LABRADO
from vialcaminera.actacaminera a, vialcaminera.actacaminerainfracciones i, vialcaminera.usuarios_suite u,
     vialcaminera.localidades lInf, vialcaminera.departamentos_partidos dInf, vialcaminera.provincias pInf,
     vialcaminera.localidades lTit, vialcaminera.departamentos_partidos dTit, vialcaminera.provincias pTit,
     vialcaminera.localidades lTes, vialcaminera.departamentos_partidos dTes, vialcaminera.provincias pTes,
     vialcaminera.infracciones t, vialcaminera.localidades lLug, vialcaminera.departamentos_partidos dLug
where a.acmid = i.acmid
  and a.acmusuarioidpda = u.usrid
  and a.acminfractorlclid = lInf.lclid(+)
  and a.acminfractordptid = lInf.dptid(+)
  and a.acminfractorpviid = lInf.pviid(+)
  and a.acminfractordptid = dInf.dptid(+)
  and a.acminfractorpviid = dInf.pviid(+)
  and a.acminfractorpviid = pInf.pviid(+)
  and a.acmpropietariolclid = lTit.lclid(+)
  and a.acmpropietariodptid = lTit.dptid(+)
  and a.acmpropietariopviid = lTit.pviid(+)
  and a.acmpropietariodptid = dTit.dptid(+)
  and a.acmpropietariopviid = dTit.pviid(+)
  and a.acmpropietariopviid = pTit.pviid(+)
  and a.acminfraccionlclid = lLug.lclid(+)
  and a.acminfracciondptid = dLug.dptid(+)
  and case nvl(to_char(a.acmtestigolclid),'0') when '0' then to_char(a.acmlclnonomtestigo) else to_char(a.acmtestigolclid) end = to_char(lTes.lclid(+))
  and case nvl(to_char(a.acmtestigodptid),'0') when '0' then to_char(a.acmdptononomtestigo) else to_char(a.acmtestigodptid) end = to_char(lTes.dptid(+))
  and case nvl(to_char(a.acmtestigopviid),'0') when '0' then to_char(a.acmpcianonomtestigo) else to_char(a.acmtestigopviid) end = to_char(lTes.pviid(+))
  and case nvl(to_char(a.acmtestigopasid),'0') when '0' then to_char(a.ACMPAISNONOMTESTIGO) else to_char(a.acmtestigopasid) end = to_char(lTes.Pasid(+))
  and case nvl(to_char(a.acmtestigodptid),'0') when '0' then to_char(a.acmdptononomtestigo) else to_char(a.acmtestigodptid) end = to_char(dTes.dptid(+))
  and case nvl(to_char(a.acmtestigopviid),'0') when '0' then to_char(a.acmpcianonomtestigo) else to_char(a.acmtestigopviid) end = to_char(dTes.pviid(+))
  and case nvl(to_char(a.acmtestigopasid),'0') when '0' then to_char(a.ACMPAISNONOMtestigo) else to_char(a.acmtestigopasid) end = to_char(dTes.Pasid(+))
  and case nvl(to_char(a.acmtestigopviid),'0') when '0' then to_char(a.acmpcianonomtestigo) else to_char(a.acmtestigopviid) end = to_char(pTes.pviid(+))
  and case nvl(to_char(a.acmtestigopasid),'0') when '0' then to_char(a.ACMPAISNONOMtestigo) else to_char(a.acmtestigopasid) end = to_char(pTes.pasid(+))
/*  and case nvl(to_char(a.acmtestigopasid),'0') when '0' then to_char(a.ACMPAISNONOMtestigo) else to_char(a.acmtestigopasid) end = to_char(paTes.Pasid(+))
  and case nvl(to_char(a.acmtestigopasid),'0') when '0' then to_char(a.ACMPAISNONOMtestigo) else to_char(a.acmtestigopasid) end = to_char(paTes.Pasid(+))*/
  and nvl(i.ifr1costo,0) = 0
  and i.ifrid = t.ifrid(+)
  and acmnro like 'X100251'
  group by a.acmid, a.acmnro, a.acmjuzgadoid,a.acmlabradafchhr,
       a.acmretenevehiculo,a.acmretienelicencia,a.acmconduccionriesgosa, a.acmdejacopia,a.acmdominio, a.acmtipovehiculo,acmmarca,a.acmcolor, a.acmvencimientofch,u.usrnm, a.acmuncid,
       a.acmcargada,a.acmpropietariodni,a.acminfractordni,a.acmfechasync, a.acmlicencianumero, a.acmcargadausuario, a.acmpropietariotipodni,
       a.acmpropietarionombre, a.acmpropietarioapellido, acmpropietariocalle,  a.acmpropietariocallenum, lTit.lcldescripcion,
       a.ACMLCLNONOMPROPIETARIO, a.ACMDPTONONOMPROPIETARIO, ACMPCIANONOMPROPIETARIO, dTit.dptdescripcion,pTit.pvidescripcion,
       a.acminfraccionruta , a.acmifrdeslugar ,a.acminfraccionkm ,a.acminfraccionreferencia,
       i.ifrcodigo, i.ifrds,acminfraccionrutanum,a.acminfractortipodni ,a.acminfractornombre, a.acminfractorapellido,
       a.acminfractorcalle,a.acminfractorcallenum ,lInf.lcldescripcion, a.ACMLCLNONOMINFRACTOR,dInf.dptdescripcion,
       a.ACMDPTONONOMINFRACTOR,pInf.pvidescripcion, a.ACMPCIANONOMINFRACTOR, a.acmlicencianumero,a.acmlicenciacategoria,
       a.acmlicenciaprocedencia, a.acmlicenciavencimiento, dLug.dptdescripcion, lLug.lcldescripcion,
       a.acmtestigodni, a.acmtestigonombre, a.acmtestigoapellido, a.acmtestigocalle, a.acmtestigocallenro, a.ACMLCLNONOMTESTIGO,
       lTes.lcldescripcion, dTes.dptdescripcion, a.ACMDPTONONOMTESTIGO, pTes.pvidescripcion, a.ACMPCIANONOMTESTIGO, a.codbarra2, 
       a.acmanio, a.acmobservaciones
