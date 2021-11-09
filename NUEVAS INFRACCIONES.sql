/*Insertar infracciones*/
Insert into VIALCAMINERA.INFRACCIONES
   (IFRID, IFRCODIGO, IFRDS, IFRCOSTO, IFRLEY, IFRARTICULO, IFRRETIENEVEHICULO, IFRRETIENELICENCIA, IFRTIPO, GRIID, IFRRESOLUCIONTIPO)
 Values
   (433, 'C-67', 'Realizar Giro a la izquierda con señal fija que lo prohibe', 
    700, '9024', 'Art. 52 inc. 38', 
    'N', 'N', 'GRAVE', 9, 'G');
COMMIT;


/*Validar que no existan en codigo_movimiento_Calculo*/
select *
from VIALCAMINERA.codigo_movimiento_calculo
where cmccodigo in ('C-67');

/*Insertar en codigo_movimiento_calculo*/
--Cambiar los ifrid generados en el insert anterior
Insert into vialcaminera.CODIGO_MOVIMIENTO_CALCULO
   (CMCID, CMCDESCRIPCION, CMCCODIGO, CMCUSUARIOALTA, CMCFECHAALTA, CMCFECHABAJA)
 select VIALCAMINERA.cmcid.nextval, ifrds,  ifrcodigo, user, sysdate, to_date('01/01/0001', 'dd/mm/yyyy')
from vialcaminera.infracciones
where ifrid in (433);
commit;

--Buscar los comportamientos para lo periodo que debiera configurarse estas infracciones
select *
from vialcaminera.obligaciones_comportamiento
where itsid = 'ACT'
and cctid = 'ACT'
and sccid = 'ACT'
and ocoperiodo = '2019'
and vialcaminera.to_null(ocofechabaja) is null;

/*Buscar cuota del comportamiento*/
select ocvid
from VIALCAMINERA.obligaciones_comp_venc
where ocoid = 70;

/*Insertar en conceptos_calculo_venc*/
--Reemplazar la cuota, segundo parámetro de acuerdo a la búsqueda anterior
Insert into vialcaminera.CONCEPTOS_CALCULOS_VENC
   (CCVID, OCVID, CMCID, CCVFUNCIONCALCULO, CCVFECHAINICIO, CCVFECHAFIN, CCVUSUARIOALTA, CCVFECHAALTA, CCVFECHABAJA, CCVORDEN) 
 select vialcaminera.ccvid.nextval, 64, cmcid, 'PKG_SVC_CALC_CONCEPTOS_INF.INFRACCION', TO_DATE('01/01/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 
    TO_DATE('01/01/0001', 'MM/DD/YYYY'), user, sysdate, TO_DATE('01/01/0001 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1
from VIALCAMINERA.codigo_movimiento_calculo
where cmccodigo in ('C-67');
commit;
