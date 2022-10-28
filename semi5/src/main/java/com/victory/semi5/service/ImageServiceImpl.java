package com.victory.semi5.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.repository.ImageDao;

@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
	private ImageDao imageDao;
	
	@Override
	public int imageUp(@RequestParam MultipartFile image) 
			throws IllegalStateException, IOException {
		int imageNumber = imageDao.sequence();
		imageDao.insert(
			ImageDto.builder()
				.fileNumber(imageNumber)
				.fileName(image.getOriginalFilename())
				.fileType(image.getContentType())
				.fileSize(image.getSize())
				.build());
		File dir = new File("C:\\study\\vic\\upload");
		dir.mkdirs();
		File target = new File(dir, String.valueOf(imageNumber));
		image.transferTo(target);
		
		return imageNumber;
	}
	
	
}
