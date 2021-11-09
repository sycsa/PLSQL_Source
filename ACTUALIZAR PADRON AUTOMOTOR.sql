UPDATE VIAL.PADRON_AUTOMOTOR
SET TPO_VEHIC = 'A'
WHERE COD_VEH <> '5';

UPDATE VIAL.PADRON_AUTOMOTOR
SET TPO_VEHIC = 'M'
WHERE COD_VEH = '5';

UPDATE VIAL.PADRON_AUTOMOTOR
SET DOMINIO = vial.migra_multas_new.Clean_Objeto(dominio_ori);

update vial.padron_automotor
set numero_documento = substr(cuit, 3,8), TIPO_DOCUMENTO = 'DNI'
where (substr(cuit, 1, 2)) between '00' and '28';

update vial.padron_automotor
set numero_documento = cuit, TIPO_DOCUMENTO = 'CUIT'
where (substr(cuit, 1, 2)) not between '00' and '28';
