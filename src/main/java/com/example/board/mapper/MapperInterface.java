package com.example.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.board.DTO.BoardDTO;


@Mapper
public interface MapperInterface {
	List<BoardDTO> getBoardDto();
}
