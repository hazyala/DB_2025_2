
Table 고객이(가) 생성되었습니다.


Table 제품이(가) 생성되었습니다.


명령의 20 행에서 시작하는 중 오류 발생 -
create table 주문(
    주문번호 varchar(5) not null,
    주문고객 varchar(20), 
    주문제품 varchar(5),
    수량 int,
    배송지 varchar(30),
    주문일자 dats,
    primary key(주문번호),
    foreign key(주문고객) references 고객(고객아이디),
    foreign key(주문제품) references 제품(제품번호)   
)
오류 보고 -
ORA-00902: 데이터유형이 부적합합니다

https://docs.oracle.com/error-help/db/ora-00902/00902. 00000 -  "invalid datatype"
*Cause:    The datatype entered in the CREATE or ALTER TABLE
           statement is not valid.
*Action:   Correct the syntax.

Table 주문이(가) 생성되었습니다.


Table 배송업체이(가) 생성되었습니다.


Table 고객이(가) 변경되었습니다.


Table 고객이(가) 변경되었습니다.

