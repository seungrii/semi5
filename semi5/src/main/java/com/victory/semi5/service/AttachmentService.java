package com.victory.semi5.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.victory.semi5.entity.ImageDto;

public interface AttachmentService {
	public int attachmentsUp(List<MultipartFile> attachments, MultipartFile file)
			throws IllegalStateException, IOException;
	public void attachmentsDelete(List<ImageDto> attachments);
}
