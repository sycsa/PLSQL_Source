# PLSQL Source
Este repositorio contiene archivos fuentes del tipo .sql y .tst. Tambien existen unos archivos .def, que sirven para importar las rendiciones de MailExpress hacia la base de datos.

## PDA_AGREGAR_FERIADOS.tst
Este .tst se utiliza para enviar las actualizaciones de los feriados que se van a agregar para el proximo año. Los feriados se deben agregar en la tabla **vialcaminera.no_laborables** previo a la ejecución del script.

## Rendicion Lote.def
Este archivo .dev funciona en PL/SQL Developer siempre y cuando se intenta importar un archivo CSV
