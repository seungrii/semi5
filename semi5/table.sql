-- DB 계정 생성, 권한 부여
create user semi5 identified by semi55555;
grant connect, resource to semi5; 

drop table movie;
create table movie(

movie_number number primary key,
movie_name varchar2(30),
opening_date date,
screening_end date,
movie_summary varchar2(3000),
movie_play_time number(3),
movie_age_limit number(2),
movie_showing varchar2(15)

);

insert into movie values(1,'블랙 아담','2022-10-19','2022-10-26','5000년 전 고대 도시 ‘칸다크’의 노예에서그 누구도 막을 수 없는 불사신으로 깨어난 ‘블랙 아담’이
자신만의 방식으로 정의를 구현하기 위해 일격에 나서는 이야기를 그린 액션 블록버스터',125,   12,null);

insert into movie values(2,'귀못','2022-10-26','2022-11-2','2022 극강 공포를 선사할, 수살귀의 저주가 시작된다!

과거 대부호였던 왕할머니의 대저택에 숨겨진 보석을 훔치기 위해 간병인으로 입주하게 된 보영.
보영을 고용한 왕할머니의 유일한 혈육인 김사모는,
‘아무도 데려오지 말 것, 특히 아이’, ‘저수지 근처에 가지 말 것’이라는 조건을 건다.
하지만 보영은, 금기를 깨고 자신의 딸 ‘다정’을 몰래 데리고 가는데...
사람 죽어 나가는 ‘귀못’이라고 불리는 저수지 옆에 위치한 
왕할머니의 거대한 저택에선 불길하고 괴이한 징조가 계속되고, 
그러던 중 보영은, 이곳을 찾은 외지인들이 의문의 변사를 당한 것을 알게 된다.',111,15,null);

insert into movie values(3,'리멤버','2022-10-26','2022-11-2',' “부서진 차… 손에 묻은 피… 권총 한 자루… 내가 왜 여기에 있는 거지?”
뇌종양 말기, 80대 알츠하이머 환자인 한필주. 일제강점기 때 친일파들에게 가족을 모두 잃었다.
아내가 세상을 떠나자 필주는 60여 년을 계획해 온 복수를 감행하려고 한다.
그는 알바 중인 패밀리 레스토랑에서 절친이 된 20대 알바생 인규에게
일주일만 운전을 도와 달라 부탁한다.

“원래 이런 사람이었어요? 정체가 뭐예요 도대체?! 같이 접시 닦던 사람 맞아요?”
이유도 모른 채 필주를 따라나선 인규는 첫 복수 현장의 CCTV에 노출되어 유력 용의자로 지목된다.
경찰은 수사망을 좁혀오고 사라져가는 기억과 싸우며 필주는 복수를 이어가는데…

60년의 계획, 복수를 위한 위험한 동행이 시작된다!',128,15,null);

insert into movie values (4,'제목4','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (5,'제목5','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (6,'제목6','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (7,'제목7','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (8,'제목8','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (9, '제목9','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (10,'제목10','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (11,'제목11','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (12,'제목12','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (13,'제목13','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (14,'제목14','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (15,'제목15','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (16,'제목16','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (17,'제목17','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (18,'제목18','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (19,'제목19','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (20,'제목20','2022-10-30','2022-11-04','"내용"',100,15,null);
insert into movie values (21,'제목21','2022-10-30','2022-11-04','"내용"',100,15,null);


