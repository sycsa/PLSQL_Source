--Buscas el objeto
select * from  vialcaminera.objetos
where ojtidentificador1 = 'X2200261';

--la obligacion
select * from  vialcaminera.obligaciones
where ojtid = 2417204;

--usas el obnid de la anterior
select sum(cceimporte) 
from  vialcaminera.cuenta_corriente
where obnid = 24172048936504;

--- si la suma de la cuenta corriente da 0 poner en el atributo CONED el estado ANU
select a.*,rowid from  vialcaminera.concontacto a
where conobjid = 'X2200261';
