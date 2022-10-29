package com.victory.semi5.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
	public int attachmentsUp(List<MultipartFile> attachments, MultipartFile file)
			throws IllegalStateException, IOException;
}
