package com.example.board.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.DTO.BoardDTO;
import com.example.board.mapper.MapperInterface;


@Service
public class BoardService {
	
	@Autowired
	private MapperInterface mapperInterface;
	
	public List<BoardDTO> getBoardDto() {
		return mapperInterface.getBoardDto();
	}

}
