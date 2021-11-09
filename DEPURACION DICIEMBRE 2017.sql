select * from control_domicilio_1_12_2017 c
where c.domicilio like '%S/N%' and c.nro_puerta = 0 and c.piso = 0 and dpto is null
and DOMICILIO not like '%M___C%' AND 
DOMICILIO not like '%M____C%' AND 
DOMICILIO not like '%M-___C%' AND 
DOMICILIO not like '%M__C%' AND
DOMICILIO not like '%M:___C%'

union all

select * from pivacm.control_domicilio_1_12_2017 c
where c.localidad = 'NO CONSIGNA'
