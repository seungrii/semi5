package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.service.AttachmentService;

@RestController	//화면반환x
@RequestMapping("/attachment")
public class AttachmentController {

	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private AttachmentService attachmentService;
	
	private final File dir = new File("C:\\study\\vic\\upload"); //파일경로
		
	@GetMapping("/download/{fileNumber}")	//이미지 보여주기(다운로드)
	public ResponseEntity<ByteArrayResource> download(
			@PathVariable int fileNumber) throws IOException {
		
		//파일탐색(DB)
		ImageDto imageDto = attachmentDao.selectOne(fileNumber);
		
		if(imageDto == null) {
			return null;
		}
		
		//파일 가져오기
//		File dir = new File("C:\\study\\vic\\upload");	//파일경로:상수처리(필드)
		File target = new File(dir, String.valueOf(fileNumber));
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//응답객체 만들어서 데이터 전송
		return ResponseEntity.ok()
//				.header("Content-Encoding", "UTF-8")
				.header(HttpHeaders.CONTENT_ENCODING, 
						StandardCharsets.UTF_8.name())
//				.header("Content-Length", String.valueOf(data.length))
				.contentLength(imageDto.getFileSize())
//				.contentType(MediaType.APPLICATION_OCTET_STREAM)			//다운로드해라
				.header(HttpHeaders.CONTENT_TYPE, imageDto.getFileType())	//열든지 다운로드하든지 맘대로
//				.header("Content-Disposition", "attachment;filename=" + String.valueOf(imageNo))
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
								.filename(
										imageDto.getFileName(), 
										StandardCharsets.UTF_8)
								.build().toString())
				.body(resource);
	}
	
	@GetMapping("/delete/{fileNumber}")	//이미지 삭제
	public void delete(@PathVariable int fileNumber) {
		List<ImageDto> attachments = attachmentDao.selectList(fileNumber);
		attachmentService.attachmentsDelete(attachments);
	}

		

	
}
