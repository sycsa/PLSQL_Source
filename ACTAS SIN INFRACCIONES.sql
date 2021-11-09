select --ACTA--
       a.acmid,
       a.acmnro AS NRO_ACTA,
       a.acmjuzgadoid AS COD_JUZGADO,
       a.acmlabradafchhr AS FECHA_ACTA,
       a.acmretenevehiculo AS RETIENE_VEHICULO,
       a.acmretienelicencia AS RETIENE_LICENCIA,
       CASE a.acmconduccionriesgosa
        when 0 then 'N' else 'S' end AS VIOLA_ART_81,
       acmdejacopia as DEJA_COPIA,
       --VEHICULO--
       a.acmdominio AS DOMINIO,
       a.acmtipovehiculo AS TIPO_VEHICULO,
       a.acmmarca AS MARCA_VEHICULO,
       a.acmcolor AS MARCA_COLOR,
       --TITULAR--
       a.acmpropietariodni as DATOS_TITULAR,
       null as DATOS_INFRACCION,
       a.acminfractordni as DATOS_INFRACTOR_TESTIGO,
       a.acmuncid as COMISARIA,
       a.acmvencimientofch AS VENCIMIENTO_ACTA,
       u.usrnm AS OFICIAL_LABRADO,
       a.acmcargada
from vialcaminera.actacaminera a, vialcaminera.actacaminerainfracciones i, vialcaminera.usuarios_suite u,
     vialcaminera.localidades lInf, vialcaminera.departamentos_partidos dInf, vialcaminera.provincias pInf,
     vialcaminera.localidades lTit, vialcaminera.departamentos_partidos dTit, vialcaminera.provincias pTit,
     vialcaminera.infracciones t
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
  and i.ifrid = t.ifrid
  and acmnro not like 'T%' 
  group by a.acmid, a.acmnro, a.acmjuzgadoid,a.acmlabradafchhr,
       a.acmretenevehiculo,a.acmretienelicencia,a.acmconduccionriesgosa, a.acmdejacopia,a.acmdominio, a.acmtipovehiculo,acmmarca,a.acmcolor, a.acmvencimientofch,u.usrnm, a.acmuncid,
       a.acmcargada,a.acmpropietariodni,a.acminfractordni
  order by fecha_acta desc nulls last;
  
select * from vialcaminera.actacaminera where acmnro like 'X%' and acmnro not in 
       (select --ACTA--
       a.acmnro
from vialcaminera.actacaminera a, vialcaminera.actacaminerainfracciones i, vialcaminera.usuarios_suite u,
     vialcaminera.localidades lInf, vialcaminera.departamentos_partidos dInf, vialcaminera.provincias pInf,
     vialcaminera.localidades lTit, vialcaminera.departamentos_partidos dTit, vialcaminera.provincias pTit,
     vialcaminera.infracciones t
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
  and a.acmid = i.acmid
  and i.ifrid = t.ifrid
  and acmnro like 'X%'
  group by a.acmid, a.acmnro, a.acmjuzgadoid,a.acmlabradafchhr,
       a.acmretenevehiculo,a.acmretienelicencia,a.acmconduccionriesgosa, a.acmdejacopia,a.acmdominio, a.acmtipovehiculo,acmmarca,a.acmcolor, a.acmvencimientofch,u.usrnm, a.acmuncid,
       a.acmcargada,a.acmpropietariodni,a.acminfractordni,a.acmfechasync, a.acmlicencianumero)
