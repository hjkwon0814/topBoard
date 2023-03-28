package com.example.board.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.DTO.BoardDTO;


@Mapper
public interface MapperInterface {
	List<BoardDTO> getBoardDto();
	
	int setBoardDto(BoardDTO boardDto);
	
	BoardDTO getDetailBoard(int id);

	int deleteBoard(int id);

	int deleteBoardSelect(ArrayList<Integer> idList);
}
