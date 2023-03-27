package com.example.board.DTO;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int id;
	
	private String writer;
	
	private String title;
	
	private String contents;
	
	private String dateTime;
	
}
