package com.victory.semi5.error;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class TargetNotFoundException extends RuntimeException{
	public TargetNotFoundException(String message) {
		super(message);
	}
	
}
