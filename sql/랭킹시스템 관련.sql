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
group by name
order by name desc;