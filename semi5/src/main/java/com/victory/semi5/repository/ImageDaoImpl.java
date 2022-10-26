package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.ImageDto;

@Repository
public class ImageDaoImpl implements ImageDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(ImageDto dto) {
		// TODO Auto-generated method stub
		String sql="insert into Image("
				+"file_number,file_name,file_type, "
				+ "file_size,file_time"
				+") values("
				+"image_seq.nextval,?,?,?,?"
				+")";
		
		Object[] param= {
				dto.getFileName(),dto.getFileType(),
				dto.getFileSize(),dto.getFileTime(),
				
		};
		jdbcTemplate.update(sql,param);
		
	}

}
