package com.example.board.Service;

import java.util.ArrayList;
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
	
	public BoardDTO getDetailBoard(int id) {
		return mapperInterface.getDetailBoard(id);
	}
	
	public int insertBoard(BoardDTO boardDto) {
		
		int retnum = mapperInterface.setBoardDto(boardDto);
		
		return retnum;
	}

	public int deleteBoard(int id) {
		
		int retnum = mapperInterface.deleteBoard(id);
		
		return retnum;
	}

	public int deleteBoardSelect(ArrayList<Integer> idList) {
		
		int retnum = mapperInterface.deleteBoardSelect(idList);
		
		return retnum;
	}	

}
