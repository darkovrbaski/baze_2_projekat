-- Upit koji broji koliko je svaki radnik napravio auspuha odredjene marke
with obuceni_radnici as (
    select distinct r.idr, r.imer
    from operater o, radnik r, je_obucen jo, radi_na rn
    where r.idr = o.idr and o.idr = jo.idr and rn.idro = jo.idr and rn.idro = o.idr
)
select r.idr, r.imer, a.nazausp, count(a.nazausp) as broj_auspuha
from obuceni_radnici r, auspuh a
where a.idro = r.idr
group by r.idr, r.imer, a.nazausp;