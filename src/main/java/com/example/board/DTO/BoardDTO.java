package com.example.board.DTO;

import lombok.Data;


@Data
public class BoardDTO {
	
	private int id;
	
	private String writer;
	
	private String title;
	
	private String contents;
	
	private String dateTime;
	
}
