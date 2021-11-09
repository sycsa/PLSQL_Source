update vial.v_acta_resuelta v set planes='SI'
where v.lote =&vlote
and orden >0;
commit;
update vial.v_acta_resuelta v set planes='NO'
where v.lote=&vLote
and orden > 0
and ( IN_NOME01 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME02 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME03 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME04 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME05 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME06 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME07 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME08 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME09 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
or IN_NOME10 in ('AC-2','AC-3,','LI-1','LI-2','LI-4')
 );
 commit;
