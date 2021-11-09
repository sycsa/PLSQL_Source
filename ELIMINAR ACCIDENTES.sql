select o.*,rowid
from vialcaminera.objetos o
where ojtidentificador1 = 'P673-25-2019-2' for update;

select d.*, rowid
from vialcaminera.objeto_datos_descriptivos  d
where ojtid in (2964164) for update;

select d.*, rowid
from vialcaminera.vinculos_persona_objeto  d
where ojtid in (2964164) for update;

select d.*, rowid
from vialcaminera.objeto_infracciones  d
where ojtid in (2964164) for update;

--Obtener ObnId Primero, antes de borrar
select d.*, rowid
from vialcaminera.obligaciones  d
where ojtid in (2964164);

select d.*, rowid
from vialcaminera.cuenta_corriente d
where obnid = '201911000000100000000040274151';

select d.*, rowid
from vialcaminera.obligaciones_Det_calculo d
where obnid = '201911000000100000000040274151';

select d.*, rowid
from vialcaminera.obligaciones_situaciones d
where obnid = '201911000000100000000040274151';

SELECT D.*,ROWID
  FROM VIALCAMINERA.ACTACAMINERA D WHERE D.ACMNRO = 'P376-20-2019-1';


--------DAR DE BAJA LOS PROCESOS
SELECT * FROM VIALCAMINERA.AINACACCIDENTE
WHERE AINACNROPROCSUM = '673' for update;

SELECT * FROM vialcaminera.ainacaccidenteainvvehiculo
WHERE AINACID = 1355066 for update;

SELECT * FROM vialcaminera.ainacaccidenteainccondiciones
WHERE AINACID = 1355066 for update;

select * from vialcaminera.concontacto c where c.conobjid in ('P673-25-2019-1') for update;
select * from vialcaminera.cmvmovimiento cd where cd.conid in(3244378) for update;

