select nombre, count(0)
  from (SELECT trim(regexp_replace(UPPER(PE_NOMB),
                                   '(((\w+)\s){1}).*', -- Change 4 to wanted number of words here!
                                   '\1')) AS NOMBRE
          FROM PERSONA)
 group by nombre
