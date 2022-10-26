package com.victory.semi5.repository;

import com.victory.semi5.entity.UserDto;

public interface UserDao {
//	회원 테이블에서 데이터 한 가지 출력
	UserDto selectOne(String userId);
	
//	회원 테이블에 데이터 삽입
	void join(UserDto userDto);
	
	UserDto selectId(String userName, String userTel);
	
	UserDto selectPw(String userId, String userName, String userTel);

}
