package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.NoticeDto;
import com.victory.semi5.vo.NoticeListSearchVO;

public interface NoticeDao {
	
	//등록
	void insert(NoticeDto noticeDto);
	int sequence();//시퀀스 발행 메소드
	int insert2(NoticeDto noticeDto);//번호까지 합쳐서 등록하는 메소드(등록에서 상세로)

	//통합 검색 메소드 (목록+검색)
	List<NoticeDto> selectList();//사용ㄴㄴ
	List<NoticeDto> selectList(NoticeListSearchVO vo);
	List<NoticeDto> list(NoticeListSearchVO vo);
	List<NoticeDto> search(NoticeListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(NoticeListSearchVO vo);
	int searchCount(NoticeListSearchVO vo);
	int listCount(NoticeListSearchVO vo);
	
	void clear();
	boolean delete(int noticeNo);
	
	//상세
	NoticeDto selectOne(int noticeNo);

	//조회수
	boolean updateReadcount(int noticeNo);
		
	//조회수 증가까지
	NoticeDto read(int noticeNo);
	
	//수정
	boolean update(NoticeDto noticeNo);

}
