package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CinemaDto;

@Repository
public class CinemaDaoImpl implements CinemaDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addCinema(CinemaDto cinemaDto) {
		String sql = "insert into cinema("
				+ "cinema_porin, cinema_base_address, cinema_detail_address, cinema_tel"
				+ ") values(?, ?, ?, ?)";
		Object[] param = {
			cinemaDto.getCinemaPorin(), cinemaDto.getCinemaBaseAddress(),
			cinemaDto.getCinemaDetailAddress(), cinemaDto.getCinemaTel()
		};
		jdbcTemplate.update(sql, param);
	}

//	@Override
//	public List<CinemaDto> selectList() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<CinemaDto> selectList(String type, String keyword) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public CinemaDto selectOne(String adminId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public boolean changeCinema(CinemaDto cinemaDto) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean deleteCinema(String adminId) {
//		// TODO Auto-generated method stub
//		return false;
//	}

}
