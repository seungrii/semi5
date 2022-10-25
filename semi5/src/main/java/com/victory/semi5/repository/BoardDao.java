package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.vo.BoardListSearchVO;


public interface BoardDao {
	
	//1. 등록
	void insert(BoardDto boardDto);
	int insert2(BoardDto boardDto);//번호까지 합쳐서 등록하는 메소드(등록에서 상세로)


	// 목록
	List<BoardDto> selectList();

	//검색
//	List<BoardDto> selectList(String type, String keyword);
	List<BoardDto> selectList(BoardListSearchVO vo);

	//3. 상세
	BoardDto selectOne(int boardNo);
	
	//DB clear
	void clear();

	//조회수
	boolean updateReadcount(int boardNo);
	
	//조회수 증가까지
	BoardDto read(int boardNo);
	
	//4. 수정
	boolean update(BoardDto boardDto);
	
	//삭제
	boolean delete(int boardNo);
	
}
