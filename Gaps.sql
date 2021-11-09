WITH aa AS
 (SELECT substr(a.acmnro,2) AS cur_value, LEAD(substr(a.acmnro,2)) OVER(ORDER BY substr(a.acmnro,2)) AS next_value
    FROM vialcaminera.actacaminera a
   where a.acmnro like 'X_______')
SELECT cur_value + 1 AS start_gap, next_value - 1 AS end_gap
  FROM aa
 WHERE next_value - cur_value > 1
   and (next_value - 1 - cur_value + 1) < 1000
 ORDER BY start_gap
