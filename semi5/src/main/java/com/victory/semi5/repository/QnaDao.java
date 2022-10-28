package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.QnaDto;
import com.victory.semi5.vo.QnaListSearchVO;

public interface QnaDao {

	//등록
	void insert(QnaDto qnaDto);
	int sequence();//시퀀스 발행 메소드
	int insert2(QnaDto qnaDto);//번호까지 합쳐서 등록하는 메소드(등록에서 상세로)

	//통합 검색 메소드 (목록+검색)
	List<QnaDto> selectList();//사용ㄴㄴ
	List<QnaDto> selectList(QnaListSearchVO vo);
	List<QnaDto> list(QnaListSearchVO vo);
	List<QnaDto> search(QnaListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(QnaListSearchVO vo);
	int searchCount(QnaListSearchVO vo);
	int listCount(QnaListSearchVO vo);
	
	// 아이디 조회
	List<QnaDto> selectIdList(String userId);
	
	void clear();
	boolean delete(int qnaNo);
	
	//상세
	QnaDto selectOne(int qnaNo);

	//조회수
	boolean updateReadcount(int qnaNo);
		
	//조회수 증가까지
	QnaDto read(int qnaNo);
	
	//수정
	boolean update(QnaDto qnaNo);
	
	//댓글추가
	void insertReply(QnaDto qnaDto);
	
}
