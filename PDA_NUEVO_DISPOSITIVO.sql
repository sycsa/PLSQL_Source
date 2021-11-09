insert all
into vialcaminera.actualizacion_pda
(acsql,acactuimei,acactubloqueado,ACEJECUTADO) values ('DELETE FROM T_EQUIPO_IMEI','&IMEI', 'N', 'N')
into vialcaminera.actualizacion_pda
(acsql,acactuimei,acactubloqueado,ACEJECUTADO) values
('INSERT INTO T_EQUIPO_IMEI (_ID,IMEI,NUMERODESERIE, LETRADESERIE,HABILITADO,PRIMERUSO) VALUES (
' || chr(39) || '&id' || chr(39) ||','|| chr(39) || '&IMEI' || chr(39) || ',' || chr(39) ||
        '&id' || chr(39) || ',' || chr(39) || 'X' || chr(39) || ',' ||
        chr(39) || 'S' || chr(39) || ',' || chr(39) || 'S' || chr(39) || ')',
'&IMEI', 'N', 'N')
SELECT * FROM DUAL;
COMMIT;
