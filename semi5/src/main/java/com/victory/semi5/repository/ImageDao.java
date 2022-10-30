package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.vo.CinemaImageVO;

public interface ImageDao {
	
	int sequence();
	void insert(ImageDto imageDto);
//	List<ImageDto> selectList();
//	ImageDto selectOne(int imageNo);
//	boolean delete(int imageNo);
	
	//지점이미지
	void addCinemaImage(CinemaDto cinemaDto, int imageNumber);
	//게시판 첨부파일 관련(board_attachment_view)
//	List<AttachmentDto> selectBoardAttachmentList(int boardNo);
}
