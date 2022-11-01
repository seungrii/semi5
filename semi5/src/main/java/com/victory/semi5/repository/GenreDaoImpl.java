package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.GenreDto;
import com.victory.semi5.vo.HashtagVO;

@Repository
public class GenreDaoImpl implements GenreDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(GenreDto dto) {
		
		String sql="insert into Genre("
				+"genre_no,genre_name"
				+") values("
				+"genre_seq.nextval,?"
				+")";
		
		Object[] param= {
				dto.getGenreNo(),
				dto.getGenreName()
		};
		jdbcTemplate.update(sql,param);
		
	}

	@Override
	public int insert2(GenreDto dto) {
		// TODO Auto-generated method stub
		String sql="select genre_seq.nextval from dual";
		int genreNo=jdbcTemplate.queryForObject(sql, int.class);
		
		 sql="insert into Genre("
				+"genre_no,genre_name"
				+") values("
				+"?,?"
				+")";
		
		Object[] param= {
				genreNo,
				dto.getGenreName()
		};
		jdbcTemplate.update(sql,param);
		
		return genreNo;
		
	}

	private RowMapper<HashtagVO> mapperHashtag = (rs, idx) -> {
        return HashtagVO.builder()
                .movieNumber(rs.getInt("movie_number"))
                .genreNo(rs.getInt("genre_no"))
                .genreName(rs.getString("genre_name"))
                .build();
	};
	@Override
    public List<HashtagVO> selectListHashtagVO(int movieNumber) {
        String sql = "select * from Hashtag_genre_view "
                + "where movie_number =?";
        Object[] param= {movieNumber};
        return jdbcTemplate.query(sql, mapperHashtag, param);
    }

}
