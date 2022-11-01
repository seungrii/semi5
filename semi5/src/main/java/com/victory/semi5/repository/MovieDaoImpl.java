package com.victory.semi5.repository;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.HashtagVO;
import com.victory.semi5.vo.MoviePlayVO;
import com.victory.semi5.vo.MovieVO;

@Repository
public class MovieDaoImpl implements MovieDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//목록 위한
	private RowMapper<MovieDto> mapper = new RowMapper<MovieDto>() {
		@Override
		public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		    MovieDto dto = new MovieDto();
			dto.setMovieNumber(rs.getInt("movie_number"));
			dto.setMovieName(rs.getString("movie_name"));
		    dto.setOpeningDate(rs.getDate("opening_date"));
			dto.setScreeningEnd(rs.getDate("screening_end"));
			dto.setMovieSummary(rs.getString("movie_summary"));
			dto.setMoviePlayTime(rs.getInt("movie_play_time"));
			dto.setMovieAgeLimit(rs.getInt("movie_age_limit"));
			
			return dto;
		}
	};
	//조회위한
	private ResultSetExtractor<MovieDto> extractor = new ResultSetExtractor<MovieDto>() {
		@Override
		public MovieDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
			    MovieDto dto = new MovieDto();
				dto.setMovieNumber(rs.getInt("movie_number"));
				dto.setMovieName(rs.getString("movie_name"));
			    dto.setOpeningDate(rs.getDate("opening_date"));
				dto.setScreeningEnd(rs.getDate("screening_end"));
				dto.setMovieSummary(rs.getString("movie_summary"));
				dto.setMoviePlayTime(rs.getInt("movie_play_time"));
				dto.setMovieAgeLimit(rs.getInt("movie_age_limit"));
				return dto;
				
			}
			else {
				return null;
			}
		}
	};


	@Override
	public void insert(MovieDto dto) {
		// TODO Auto-generated method stub
		
		String sql="insert into movie("
				+"movie_number,movie_name,opening_date, "
				+"screening_end, movie_summary,movie_play_time,movie_age_limit"
				+ ") values("
				+"movie_seq.nextval,?,?,?,?,?,?"
				+")";
		
		Object[] param= {
				dto.getMovieName(),dto.getOpeningDate(),
				dto.getScreeningEnd(),dto.getMovieSummary(),
				dto.getMoviePlayTime(),dto.getMovieAgeLimit()
		};
		jdbcTemplate.update(sql,param);
	}
	@Override
    public int insert2(MovieVO movieVO) {
        // TODO Auto-generated method stub
    String sql="select movie_seq.nextval from dual";
    int movieNumber=jdbcTemplate.queryForObject(sql, int.class);

    sql="insert into movie("
            +"movie_number,movie_name,opening_date, "
            +"screening_end, movie_summary,movie_play_time,movie_age_limit"
            + ") values("
            +"?,?,?,?,?,?,?"
            +")";
    Object[] param= {
            movieNumber,movieVO.getMovieName(),movieVO.getOpeningDate(),
            movieVO.getScreeningEnd(),movieVO.getMovieSummary(),
            movieVO.getMoviePlayTime(),movieVO.getMovieAgeLimit(),

    };
        jdbcTemplate.update(sql, param);
        return movieNumber;
    }
	
	@Override
	public List<MovieDto> selectList() {//목록
		  String sql="select*from movie order by movie_number asc";
			return jdbcTemplate.query(sql, mapper);
	}

	@Override//검색
	public List<MovieDto> selectList(String type, String keyword) {
		String sql="select*from movie "
				+"where instr(#1,?)>0"
				+"order by #1 asc";
		sql=sql.replace("#1", type);
		Object[] param= {keyword};
		return jdbcTemplate.query(sql, mapper,param);
	}

	@Override
	public MovieDto selectOne(int movieNumber) {//상세 조회
	    String sql="select * from movie where movie_number=?";
	    Object[]param= {movieNumber};
	    return jdbcTemplate.query(sql, extractor, param);
	 }

	@Override
	public boolean update(MovieDto dto) {
		String sql="update movie "
				+"set "
				+"movie_name=?,opening_date=?,screening_end=?,movie_summary=?,movie_play_time=?,movie_age_limit=? "
				+"where "
					+"movie_number=?";
		

		Object[] param= {
				dto.getMovieName(),dto.getOpeningDate(),
				dto.getScreeningEnd(),dto.getMovieSummary(),
				dto.getMoviePlayTime(),dto.getMovieAgeLimit(),
				dto.getMovieNumber()
		};
		return jdbcTemplate.update(sql,param)>0;
	}

	@Override//삭제
	public boolean delete(int movieNumber) {
		String sql="delete movie where movie_number=?";
		Object[] param= {movieNumber};
		return jdbcTemplate.update(sql,param)>0;
		
	}

	
	


	@Override
	public void insertHashtag(int movieNumber, int genreNo) {
		String sql = "insert into hashtag values(?, ?)";
		Object[] param = {movieNumber, genreNo};
		jdbcTemplate.update(sql, param);
	}
	//MovieListVO mapper
	private RowMapper<MovieVO> mapperMVO = (rs, idx) -> {
		return MovieVO.builder()
					.movieNumber(rs.getInt("movie_number"))
					.movieAgeLimit(rs.getInt("movie_Age_Limit"))
					.moviePlayTime(rs.getInt("movie_play_time"))
					.movieName(rs.getString("movie_name"))
					.movieSummary(rs.getString("movie_summary"))
					.openingDate(rs.getString("opening_date"))
					.screeningEnd(rs.getString("screening_end"))
					
					.characterNumber(rs.getInt("character_number"))
					.characterAge(rs.getInt("character_age"))
					.charaterName(rs.getString("charater_name"))
					.characterAwards(rs.getString("character_awards"))
					.characterFilmography(rs.getString("character_filmography"))
					.characterType(rs.getString("character_type"))
					.characterNationality(rs.getString("character_nationality"))
					
					.genreNo(rs.getInt("genre_no"))
					.genreName(rs.getString("genre_name"))
					
			
				.build();
	};
	
	
	
	
	@Override
	public List<MovieVO> selectMovieViewList() {
		String sql="select*from movie_character_hashtag_view"
				+"order by movie_number desc";
		
		return jdbcTemplate.query(sql, mapperMVO);
	}

	@Override
	public List<MovieVO> selectMovieViewList(String type, String keyword){
		String sql = "select * from movie_character_hashtag_view "
				+ "where instr(#1, ?) >0 "
				+ "order by movie_number desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapperMVO, param);
	}
	private ResultSetExtractor<MovieVO> extractorMVO = (rs) -> {
		if(rs.next()) {
			return MovieVO.builder()
					.movieNumber(rs.getInt("movie_number"))
					.movieAgeLimit(rs.getInt("movie_Age_Limit"))
					.moviePlayTime(rs.getInt("movie_play_time"))
					.movieName(rs.getString("movie_name"))
					.movieSummary(rs.getString("movie_summary"))
					.openingDate(rs.getString("opening_date"))
					.screeningEnd(rs.getString("screening_end"))
					
					.characterNumber(rs.getInt("character_number"))
					.characterAge(rs.getInt("character_age"))
					.charaterName(rs.getString("charater_name"))
					.characterAwards(rs.getString("character_awards"))
					.characterFilmography(rs.getString("character_filmography"))
					.characterType(rs.getString("character_type"))
					.characterNationality(rs.getString("character_nationality"))
					
					.genreNo(rs.getInt("genre_no"))
					.genreName(rs.getString("genre_name"))
					
			
				.build();
		}
		else {
			return null;
		}
	};
	
	
	@Override
	public MovieVO selectMovieView(int movieNumber) {
		String sql = "select * from MOVIE_CHARACTER_HASHTAG_VIEW "
				+ "where movie_number = ?";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, extractorMVO, param);
	}

	private ResultSetExtractor<HashtagVO> extractorHashtagVO = (rs) -> {
		if(rs.next()) {
			return HashtagVO.builder()
						.genreNo(rs.getInt("genre_no"))
						.movieNumber(rs.getInt("movie_number"))
						.genreName(rs.getString("genre_name"))
					.build();
		}
		else {
			return null;
		}
	};
	@Override
	public HashtagVO selectOneHashtagVO(int movieNumber) {
		String sql = "select * from Hashtag_genre_view "
				+ "where movie_number = ?";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, extractorHashtagVO, param);
	}
	
	private RowMapper<HashtagVO> mapperHashtagVO = (rs, idx) -> {
		if(rs.next()) {
			return HashtagVO.builder()
//						.genreNo(rs.getInt("genre_no"))
//						.movieNumber(rs.getInt("movie_number"))
						.genreName(rs.getString("genre_name"))
					.build();
		}
		else {
			return null;
		}
	};
	

	@Override
	public List<HashtagVO> selectListHashtagVO(int movieNumber) {
		String sql = "select genre_name from Hashtag_genre_view "
				+ "where movie_number = ?";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, mapperHashtagVO, param);
	}
	
	
//	
//	@Override
//	public List<HashtagVO> selectListHashtagVO(int genreNo) {
//		String sql = "select * from Hashtag_genre_view "
//				+ "where gnere_no = ?";
//		Object[] param = {genreNo};
//		return jdbcTemplate.query(sql, mapperHashtagVO, param);
//	}

	
	
//	@Override
//	public List<HashtagVO> selectListHashtagVO(String genreName) {
//		String sql = "select * from Hashtag_genre_view "
//				+ "where genre_no = ?";
//		Object[] param = {genreName};
//		return jdbcTemplate.query(sql, mapperHashtagVO, param);
//	}

	
	
	
	
	
	
}