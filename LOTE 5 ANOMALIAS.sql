select * from filtro_zonas f
left join lote_5 l
on f.nro_acta = l.nro_acta and f.nro_seri = l.nro_seri for update;

select v.* from lote_5 l
right join vial.v_acta_resuelta v
on l.nro_acta = v.nro_acta and l.nro_seri = v.nro_seri
where v.lote = 5 and l.nro_acta is not null and l.nro_seri is not null;
