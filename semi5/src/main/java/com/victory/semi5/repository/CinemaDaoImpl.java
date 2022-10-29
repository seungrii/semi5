package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
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

	private RowMapper<CinemaDto> mapper = (rs, idx) -> {
		return CinemaDto.builder()
					.cinemaPorin(rs.getString("cinema_porin"))
					.cinemaBaseAddress(rs.getString("cinema_base_address"))
					.cinemaDetailAddress(rs.getString("cinema_detail_address"))
					.cinemaTel(rs.getString("cinema_tel"))
				.build();
	};
	@Override
	public List<CinemaDto> selectList() {
		String sql = "select * from cinema order by cinema_porin asc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<CinemaDto> selectList(String type, String keyword) {
		String sql = "select * from cinema "
					+ "where instr(#1, ?) >0 "
					+ "order by cinema_porin asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	private ResultSetExtractor<CinemaDto> extractor = (rs) -> {
		if(rs.next()) {
			return CinemaDto.builder()
					.cinemaPorin(rs.getString("cinema_porin"))
					.cinemaBaseAddress(rs.getString("cinema_base_address"))
					.cinemaDetailAddress(rs.getString("cinema_detail_address"))
					.cinemaTel(rs.getString("cinema_tel"))
				.build();
		}
		else {
			return null;
		}
	};
	@Override
	public CinemaDto selectOne(String cinemaPorin) {
		String sql = "select * from cinema "
					+ "where cinema_porin = ?";
		Object[] param = {cinemaPorin};
		return jdbcTemplate.query(sql, extractor, param);
	}
//
//	@Override
//	public boolean changeCinema(CinemaDto cinemaDto) {
//		// TODO Auto-generated method stub
//		return false;
//	}

	@Override
	public boolean deleteCinema(String cinemaPorin) {
		String sql = "delete cinema "
						+ "where Cinema_Porin = ?";
		Object[] param = {cinemaPorin};
		return jdbcTemplate.update(sql, param) >0;
	}

}
