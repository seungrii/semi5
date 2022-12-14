-- DB 계정 생성, 권한 부여
create user semi5 identified by semi55555;
grant connect, resource to semi5; 





<<<<<<< HEAD
create table user_information(
    user_id varchar2(20) primary key check(regexp_like(user_id, '^[a-z0-9]{5,20}$')),
    user_pw varchar2(16) not null check(
        regexp_like(user_pw, '^[a-zA-Z0-9!@#$]{8,16}$')
        and
        regexp_like(user_pw, '[a-z]')
        and
        regexp_like(user_pw, '[A-Z]')
        and
        regexp_like(user_pw, '[0-9]')
        and
        regexp_like(user_pw, '[!@#$]')
    ),
    user_name varchar2(21) not null check(regexp_like(user_name, '^[가-힣]{2,7}$')),
    user_gender char(6) not null,
    user_birth date not null,
    user_email varchar2(30) not null,
    user_rank varchar2(9) default '일반' not null check(user_rank in ('일반', 'VIP', '관리자')),
    user_tel char(13) not null check(regexp_like(user_tel, '^010[0-9]{8}$'))
);

--영화
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

--인물2 
create table character(

character_number number primary key,
movie_number references movie(movie_number) on delete set null,
charater_name number,
character_age number(6),
character_awards varchar2(30),
character_filmography varchar2(60),
character_type varchar2(9),
character_nationality varchar2(36)
);

---영화 장르 
create table genre(
genre_no number primary key,
genre_name varchar2(24) unique not null
);

---선호장르 
create table category (
user_id references user_information(user_id) on delete cascade,
genre_no references genre(genre_no) on delete cascade
);

-----해시태그
create table hashtag(
movie_number references movie(movie_number) on delete cascade,
genre_no references genre(genre_no) on delete cascade
);


----------영화관(지점별)
create table cinema (
cinema_porin varchar2(45) primary key,
cinema_base_address varchar2(150),
cinema_detail_address varchar2(50),
cinema_tel varchar2(45)

);

------음식
create table food(
cinema_porin references cinema(cinema_porin),
food varchar2(45),
food_type varchar2(9),
food_price number
);


--------상영관 
create table theater(
theater_num number(4) primary key,
cinema_porin references cinema(cinema_porin) on delete cascade,
theater_total_seat number(3),
theater_hall number(2),
theater_type char(9)
);

---------------이미지
create table image(
 file_number number primary key,
 file_name varchar2(256) not null,
 file_type varchar2(10)not null,
 file_size varchar2(7) not null,
 file_time date not null
 );

----회원 프로필 사진  
create table profile_image(
user_id references user_information(user_id) on delete cascade,
file_number references image(file_number) on delete cascade
);

 ---------영화 포스터
 create table poster(
 movie_number references movie(movie_number) on delete cascade,
 file_number references image(file_number) on delete cascade
 

 
);

----가격표
create table theater_price(
theater_num references theater(theater_num),
age_division number(2),
price number(5)
);

-------상영관 좌석
create table theater_seat(
seat_num number(3) primary key,
theater_num references theater(theater_num) on delete cascade,
seat_row varchar2(2),
seat_line number(2)
);

----------------상영 스케줄 
create table movie_play(
movie_play_num number primary key,
movie_number references movie(movie_number) on delete cascade,
theater_num references theater(theater_num) on delete cascade,
movie_play_start date,
movie_date date

);
------------예매내역 
create table ticketing(
ticketing_num number primary key,
user_id references user_information(user_id) on delete cascade,
movie_play_num references movie_play(movie_play_num),
seat_num references theater_seat(seat_num),
ticketing_time date not null,
price_total number(7) not null

);
------한줄평 
create table review (
review_num number primary key,
user_id references user_information(user_id) on delete set null,
movie_number references movie(movie_number) on delete cascade, 
one_line_review varchar2(100),
review_grade number(2),
write_time date
);

----한줄평 좋아요 
create table review_like (
user_id references user_information(user_id) on delete cascade,
review_num references review(review_num) on delete cascade,
like_count number
);

--상영관 이미지 
create table theater_image(
file_number references image(file_number) on delete cascade,
theater_num references theater(theater_num) on delete cascade
);

--지점 이미지  
create table cinema_image(
cinema_porin references cinema(cinema_porin) on delete cascade,
file_number references image(file_number) on delete cascade

);

 -------인물 이미지 
 create table character_image(
 character_number references character(character_number) on delete cascade,
 file_number references image(file_number) on delete cascade
 );








-- 공지게시판 테이블

create table notice_board(
notice_no number primary key,
admin_id references admin(admin_id) on delete cascade,
notice_title varchar2(300) not null,
notice_contents varchar2(4000) not null,
notice_write_time date default sysdate not null,
notice_update_time date,
notice_read number default 0 not null check(notice_read >= 0),
notice_like number default 0 not null check(notice_like >= 0)
);

create sequence notice_board_seq;


-- 문의게시판 테이블

create table qna_board(
qna_no number primary key,
qna_writer references user_information(user_id) on delete set null,
admin_id references admin(admin_id) on delete cascade,
qna_title varchar2(300) not null,
qna_contents varchar2(4000) not null,
qna_write_time date default sysdate not null,
qna_read number default 0 not null check(qna_read >= 0),
qna_answer  varchar2(4000),
qna_answer_time date default sysdate not null
);

create sequence qna_board_seq;

-- 자유게시판 테이블

drop table board;
create table board(
board_no number primary key,
board_writer references user_information(user_id) on delete set null,
board_title varchar2(300) not null,
board_contents varchar2(4000) not null,
board_write_time date default sysdate not null,
board_update_time date,
board_read number default 0 not null check(board_read >= 0),
board_head varchar2(12) check(board_head in('사담', '영화정보', '영화리뷰', '극장후기')),
board_like number default 0 not null check(board_like >= 0)
);

drop sequence board_seq;
create sequence board_seq;

-- 댓글 테이블
create table reply(
reply_no number primary key,
reply_writer references user_information(user_id) on delete set null,
reply_origin references board(board_no) on delete cascade,
reply_content varchar2(3000) not null,
reply_write_time date default sysdate not null,
reply_update_time date,
reply_blind char(1) check(reply_blind = 'Y')
);

create sequence reply_seq;


-- 좋아요 테이블
create table free_board_like (
user_id references user_information(user_id) on delete cascade not null,
board_no references board(board_no) on delete cascade not null,
primary key(user_id, board_no)
);


-- admin 관리자 테이블 생성
create table admin(
    admin_id varchar2(20) primary key check(regexp_like(admin_id, '^[a-z0-9]{5,10}$')),
    admin_pw varchar2(16) not null check(
        regexp_like(admin_pw, '^(?=.*[!@#$])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9!@#$]{8,16}$')),
    employee_no number(3) not null unique check(employee_no between 0 and 999)
);

=======
create table user(
    user_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z0-9]{5,20}$')),
    user_pw varchar2(16) not null check(
        regexp_like(member_pw, '^[a-zA-Z0-9!@#$]{8,16}$')
        and
        regexp_like(member_pw, '[a-z]')
        and
        regexp_like(member_pw, '[A-Z]')
        and
        regexp_like(member_pw, '[0-9]')
        and
        regexp_like(member_pw, '[!@#$]')
    ),
    user_name varchar2(21) not null check(regexp_like(user_name, '^[가-힣]{2,7}$')),
    user_gender char(6) not null,
    user_birth date not null,
    user_email varchar2(30) not null,
    user_rank varchar2(9) default '일반' not null check(member_grade in ('일반', 'VIP', '관리자')),
    user_tel char(13) not null check(regexp_like(member_tel, '^010[0-9]{8}$'))
);

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


-- 공지게시판 테이블

create table notice_board(
notice_no number primary key,
admin_id references admin(admin_id) on delete cascade,
notice_title varchar2(300) not null,
notice_contents varchar2(4000) not null,
notice_write_time date default sysdate not null,
notice_update_time date,
notice_read number default 0 not null check(notice_read >= 0),
notice_like number default 0 not null check(notice_like >= 0)
);

create sequence notice_board_seq;


-- 문의게시판 테이블

create table qna_board(
qna_no number primary key,
qna_writer references user_information(user_id) on delete set null,
admin_id references admin(admin_id) on delete cascade,
qna_title varchar2(300) not null,
qna_contents varchar2(4000) not null,
qna_write_time date default sysdate not null,
qna_read number default 0 not null check(qna_read >= 0),
qna_answer  varchar2(4000),
qna_answer_time date default sysdate not null
);

create sequence qna_board_seq;

-- 자유게시판 테이블

drop table board;
create table board(
board_no number primary key,
board_writer references user_information(user_id) on delete set null,
board_title varchar2(300) not null,
board_contents varchar2(4000) not null,
board_write_time date default sysdate not null,
board_update_time date,
board_read number default 0 not null check(board_read >= 0),
board_head varchar2(12) check(board_head in('사담', '영화정보', '영화리뷰', '극장후기')),
board_like number default 0 not null check(board_like >= 0)
);

drop sequence board_seq;
create sequence board_seq;

-- 댓글 테이블
create table reply(
reply_no number primary key,
reply_writer references user_information(user_id) on delete set null,
reply_origin references board(board_no) on delete cascade,
reply_content varchar2(3000) not null,
reply_write_time date default sysdate not null,
reply_update_time date,
reply_blind char(1) check(reply_blind = 'Y')
);

create sequence reply_seq;


-- 좋아요 테이블
create table free_board_like (
user_id references user_information(user_id) on delete cascade not null,
board_no references board(board_no) on delete cascade not null,
primary key(user_id, board_no)
);


-- admin 관리자 테이블 생성
create table admin(
    admin_id varchar2(20) primary key check(regexp_like(admin_id, '^[a-z0-9]{5,10}$')),
    admin_pw varchar2(16) not null check(
        regexp_like(admin_pw, '^(?=.*[!@#$])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9!@#$]{8,16}$')),
    employee_no number(3) not null unique check(employee_no between 0 and 999)
);
>>>>>>> refs/remotes/origin/main

