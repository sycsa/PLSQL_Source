select resoluci||
       Apellido||
       Nombre||
       Domicilio||
       Departamento||
       Codigo_postal||
       codigo_barra from (
select Rpad(Nro_seri || Nro_acta, 15, ' ') as resoluci,
      Rpad(Substr(trim(Substr(vial.pck_apex_utils.corregirCaractAPEX(a.apellido_nombre),
                              1,
                              instr(vial.pck_apex_utils.corregirCaractAPEX(a.apellido_nombre), ',') - 1)),
                  1,
                  30),
           30,
           ' ') as Apellido,
      Rpad(Substr(trim(Substr(vial.pck_apex_utils.corregirCaractAPEX(a.apellido_nombre),
                             instr(vial.pck_apex_utils.corregirCaractAPEX(a.apellido_nombre), ',') + 1,Length(a.apellido_nombre))),
                  1,
                  30),
           30,
           ' ') as Nombre,
           
          Substr(Rpad(TRIM(A.Domicilio||' '||A.NROPUERTA|| ' Piso:'||A.PISO||' Dpto:'|| A.DPTO||' '||A.DEPARTAMENTO),30, ' '),1,30) AS Domicilio,
          Substr(Rpad(TRIM(a.Localidad),30,' '),1,30) as Departamento,
          Substr(Rpad(Trim(A.Codigo_postal),4,' '),1,4) as Codigo_postal,
          Rpad(Lpad(Lote,4,'0')||Lpad(orden,6,'0'),20,' ') as Codigo_barra
             
 from vialcaminera.v_acta_resuelta a
where a.lote = &vLote
  and orden > 0
order by orden);
