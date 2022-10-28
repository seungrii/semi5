package com.victory.semi5.service;

import java.io.IOException;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
	public int imageUp(@RequestParam MultipartFile image) throws IllegalStateException, IOException;
}
