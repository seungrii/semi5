package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class UserDto {
	private String userId, userPw, userName, userGender,
	userEmail, userRank, userTel, userBlurb;
	private Date userBirth;

}
