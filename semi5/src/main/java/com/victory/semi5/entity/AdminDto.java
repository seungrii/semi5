package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AdminDto {
	private String adminId, adminPw, adminAddMemo;
	private int employeeNo;
	private Date adminAddDate;
}
