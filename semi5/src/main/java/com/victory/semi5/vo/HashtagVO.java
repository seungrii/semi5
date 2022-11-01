package com.victory.semi5.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class HashtagVO {

    private int genreNo;

    //해시태그
    private int movieNumber;

    //영화장르
    private String genreName;

}