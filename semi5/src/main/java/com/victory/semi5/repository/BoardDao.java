package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.vo.BoardListSearchVO;

 
public interface BoardDao {
	
	//1. 등록
	void insert(BoardDto boardDto);
	int sequence();//시퀀스 발행 메소드
	int insert2(BoardDto boardDto);//번호까지 합쳐서 등록하는 메소드(등록에서 상세로)


	// 목록
	List<BoardDto> selectList(); //안쓰는데 왜 있냐고
	//검색
//	List<BoardDto> selectList(String type, String keyword);
	List<BoardDto> selectList(BoardListSearchVO vo);

	//목록
	List<BoardDto> list(BoardListSearchVO vo);
	//검색
	List<BoardDto> search(BoardListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(BoardListSearchVO vo);
	int searchCount(BoardListSearchVO vo);
	int listCount(BoardListSearchVO vo);
	
	// 아이디 조회
	List<BoardDto> selectIdList(String userId);

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
