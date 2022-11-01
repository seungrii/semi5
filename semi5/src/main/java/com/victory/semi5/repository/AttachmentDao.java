package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.ImageDto;

public interface AttachmentDao {
	
//	이미지 데이터
	int sequence();
	void insert(ImageDto imageDto);	
	List<ImageDto> selectList();
	ImageDto selectOne(int fileNumber);
	List<ImageDto> selectList(int fileNumber);
	boolean delete(int fileNumber);
	
	
//	종류별 이미지
	//지점이미지
	void addCinemaImage(String cinemaPorin, int fileNumber);
	List<ImageDto> selectCinemaImageList(String cinemaPorin);
	
	//영화포스터
	void addPoster(int movieNumber, int fileNumber);
	List<ImageDto> selectPosterList(int movieNumber);
	//무비차트 조회용
	List<ImageDto> selectPosterList();
//	List<ImageDto> selectPosterList(String keyword);
//	List<ImageDto> selectPosterList(String type,String keyword);
	List<ImageDto> fileNumber(int movieNumber);
	
	//회원프로필
	void addProfileImage(String userId, int fileNumber);
	List<ImageDto> selectProfileImageList(String userId);
}
