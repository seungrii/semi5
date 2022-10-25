-- DB 계정 생성, 권한 부여
create user semi5 identified by semi55555;
grant connect, resource to semi5; 





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
    user_rank varchar2(9) default '일반' not null check(user_rank in ('일반', 'VIP')),
    user_tel char(11) not null check(regexp_like(user_tel, '^010[0-9]{8}$'))
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

alter table character modify (charater_name varchar2(21));

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
    regexp_like(admin_pw, '^[a-zA-Z0-9!@#$]{8,16}$')
    and
    regexp_like(admin_pw, '[a-z]')
    and
    regexp_like(admin_pw, '[A-Z]')
    and
    regexp_like(admin_pw, '[0-9]')
    and
    regexp_like(admin_pw, '[!@#$]')),
    employee_no number(3) not null unique check(employee_no between 0 and 999)
);
-- admin 관리자 테이블 컬럼 수정 구문
alter table admin modify admin_id varchar2(7);
alter table admin add admin_addMemo varchar2(150);
alter table admin add admin_addDate date default sysdate not null;
-- admin 관리자 테이블 기본데이터 1개 추가       
insert into admin(admin_id, admin_pw, employee_no) values('admin01', 'Admin01!', 1);


--sequence 추가
create sequence movie_seq;
create sequence theater_seq;
create sequence movie_play_seq;
create sequence genre_seq;
create sequence image_seq;
create sequence theater_seat_seq;
create sequence ticketing_seq;
create sequence review_seq;

--상영관 타입 자료형 변경 char(9) -> varchar2(12)로 변경
alter table theater modify(theater_type varchar2(12));

--상영일 컬럼 삭제 (날짜, 시간 따로 저장 하는 방법을 도저히 모르겠음)
alter table movie_play drop column movie_date;


--date format 변경 (시간까지 저장하기 위해서 변경)
alter session set nls_date_format = 'yyyy-MM-dd hh24:mi';

