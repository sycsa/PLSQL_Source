select --INFRACTOR--
       a.acminfractordni AS INFRACTOR_DNI_,
       a.acminfractortipodni AS INFRACTOR_TIPO_DNI,
       a.acminfractornombre AS INFRACTOR_NOMBRE,
       a.acminfractorapellido AS APELLIDO_INFRACTOR,
       a.acminfractorcalle AS DOMICILIO_INFRACTOR,
       a.acminfractorcallenum AS INFRACTOR_NRO_PUERTA,
       case nvl(lInf.lcldescripcion,'XXX') when 'XXX' then upper(a.ACMLCLNONOMINFRACTOR) else upper(lInf.lcldescripcion) end AS INFRACTOR_LOCALIDAD,
       case nvl(dInf.dptdescripcion,'XXX') when 'XXX' then upper(a.ACMDPTONONOMINFRACTOR) else upper(dInf.dptdescripcion) end AS INFRACTOR_DEPARTAMENTO,
       case nvl(pInf.pvidescripcion,'XXX') when 'XXX' then upper(a.ACMPCIANONOMINFRACTOR) else upper(pInf.pvidescripcion) end AS INFRACTOR_PROVINCIA,
       paisInf.Pasdescripcion
  from vialcaminera.actacaminera a, vialcaminera.localidades lInf, 
       vialcaminera.departamentos_partidos dInf, vialcaminera.provincias pInf, vialcaminera.paises paisInf
 where a.acminfractorlclid = lInf.lclid(+)
   and a.acminfractordptid = lInf.dptid(+)
   and a.acminfractorpviid = lInf.pviid(+)
   and a.acminfractorpasid = lInf.pasid(+)
   and a.acminfractordptid = dInf.dptid(+)
   and a.acminfractorpviid = dInf.pviid(+)
   and a.acminfractorpasid = dInf.pasid(+)
   and a.acminfractorpviid = pInf.pviid(+)
   and a.acminfractorpasid = pInf.pasid(+)
   and case nvl(a.acminfractorpasid,0) when 0 then a.ACMPAISNONOMINFRACTOR else a.acminfractorpasid end = paisInf.Pasid(+);
   
   
   select a.acmpropietariodni AS TITULAR_DNI,
       a.acmpropietariotipodni AS TITULAR_TIPO_DOC,
       a.acmpropietarionombre AS TITULAR_NOMBRE,
       a.acmpropietarioapellido AS TITULAR_APELLIDO,
       a.acmpropietariocalle AS TITULAR_DOMICILIO,
       a.acmpropietariocallenum TITULAR_NRO_PUERTA,
       case nvl(lTit.lcldescripcion,'XXX') when 'XXX' then upper(a.ACMLCLNONOMPROPIETARIO) else upper(lTit.lcldescripcion) end AS INFRACTOR_LOCALIDAD,
       case nvl(dTit.dptdescripcion,'XXX') when 'XXX' then upper(a.ACMDPTONONOMPROPIETARIO) else upper(dTit.dptdescripcion) end AS INFRACTOR_DEPARTAMENTO,
       case nvl(pTit.pvidescripcion,'XXX') when 'XXX' then upper(a.ACMPCIANONOMPROPIETARIO) else upper(pTit.pvidescripcion) end AS INFRACTOR_PROVINCIA,
       paTit.Pasdescripcion
from vialcaminera.actacaminera a, vialcaminera.localidades lTit, 
     vialcaminera.departamentos_partidos dTit, vialcaminera.provincias pTit, 
     vialcaminera.paises paTit
where a.acmpropietariolclid = lTit.lclid(+)
  and a.acmpropietariodptid = lTit.dptid(+)
  and a.acmpropietariopviid = lTit.pviid(+)
  and a.acmpropietariodptid = dTit.dptid(+)
  and a.acmpropietariopviid = dTit.pviid(+)
  and a.acmpropietariopviid = pTit.pviid(+)
  and a.acmpropietariopasid = paTit.pasid(+)
  and case nvl(a.acmpropietariopasid,0) when 0 then a.ACMPAISNONOMPROPIETARIO else a.acmpropietariopasid end = paTit.Pasid(+);
