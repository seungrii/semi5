package com.victory.semi5.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.repository.AttachmentDao;

@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File dir = new File("C:\\study\\vic\\upload"); //파일경로
	
	@Override
	public int attachmentsUp(List<MultipartFile> attachments, MultipartFile file)
			throws IllegalStateException, IOException {
		
		//DB등록
		int fileNumber = attachmentDao.sequence();
		attachmentDao.insert(
				ImageDto.builder()
					.fileNumber(fileNumber)
					.fileName(file.getOriginalFilename())
					.fileType(file.getContentType())
					.fileSize(file.getSize())
					.build());
		//파일저장
//		File dir = new File("C:\\study\\vic\\upload");	//파일경로:상수처리(필드)
//		dir.mkdirs();	//파일생성:메소드처리(@PostConstruct)
		File target = new File(dir, String.valueOf(fileNumber)); //파일이름 지정
		file.transferTo(target);	//저장!
		
		return fileNumber;
	}
	
		
	
}
