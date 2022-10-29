package com.victory.semi5.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class HashtagVO {
	
	//vo는 값 오브젝트로써 값을 위해 쓰인다
	//read only의 특징을 가진다.
	//dto와 유사하지만 getter기능만 존재합니다.
	
	
	
	
	
	private int movieNumber;
	private int genreNo;
//	public static Object selectOne(int movieNumber) {
//		// TODO Auto-generated method stub
//		return movieNumber;
//	}
//	public static Object selectOne(int genreNo) {
//		return genreNo;
//	}

}
