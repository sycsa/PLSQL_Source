update vial.v_acta_resuelta a 
set Apellido_nombre =vial.utils.reencode(Apellido_nombre),infraccion=vial.utils.reencode(Infraccion),
    a.lugar_infraccion=vial.utils.reencode(A.Lugar_Infraccion), domicilio=vial.utils.reencode(a.domicilio)
where a.lote = &vLote;
commit;
