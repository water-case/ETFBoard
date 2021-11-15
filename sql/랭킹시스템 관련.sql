-- 닉네임순, 금액순 정렬
select name, itemcode
from etf_mock
order by name desc, buymoney desc;

-- 닉네임별 종목코드 행으로 출력
select name, listagg(itemcode, ',') within group(order by buymoney desc) as itemcodes
from
(
    select name, itemcode, buymoney
    from etf_mock
) 
group by name;

-- 랭킹 폼 조회
select name, money, joindate, itemcodeList
from etf_member t1
left outer join 
(
    select name, listagg(itemcode, ',') within group(order by buymoney desc) as itemcodeList
    from
    (
        select name, itemcode, buymoney
        from etf_mock
    ) 
    group by name
)
using(name);