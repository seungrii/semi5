-- DB 계정 생성, 권한 부여
create user semi5 identified by semi55555;
grant connect, resource to semi5; 

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