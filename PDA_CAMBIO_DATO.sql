/* || _id || IMEI || HABILITADO || NUMERODESERIE || LETRADESERIE || PRIMERUSO */
--NUMERO DE ID DEL EQUIPO--
insert into vialcaminera.actualizacion_pda
(acsql,acactuimei,acactubloqueado,ACEJECUTADO) values
('UPDATE T_EQUIPO_IMEI SET NUMERODESERIE =' || chr(39) ||'&ID'|| chr(39) || 'WHERE IMEI =' || chr(39) ||'&IMEI'
|| chr(39)||';',
'&IMEI','N','N');
COMMIT;
--LETRA DE SERIE--
insert into vialcaminera.actualizacion_pda
(acsql,acactuimei,acactubloqueado,ACEJECUTADO) values
('UPDATE T_EQUIPO_IMEI SET LETRADESERIE =' || chr(39) ||'&letra'|| chr(39) || 'WHERE IMEI =' || chr(39) ||'&IMEI'
|| chr(39)||';',
'&IMEI','N','N');
COMMIT;
