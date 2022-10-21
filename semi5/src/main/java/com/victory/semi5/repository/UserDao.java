package com.victory.semi5.repository;

import com.victory.semi5.entity.UserDto;

public interface UserDao {
	UserDto selectOne(String userId);
}
