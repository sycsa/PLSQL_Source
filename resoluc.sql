select SUBSTR(html_body, 1, INSTR(HTML_BODY,'Por ello,') - 23) AS HEAD,
       SUBSTR(html_body, INSTR(HTML_BODY,'Por ello,') - 20, INSTR(HTML_BODY,'RESUELVE') - 9) AS MID,
       SUBSTR(html_body, INSTR(HTML_BODY,'RESUELVE') - 9 ) AS FOOT
  from tipo_resoluciones
where tipo_res = 'FTFCS'
