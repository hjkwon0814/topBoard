package com.example.board.Controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.board.DTO.BoardDTO;
import com.example.board.DTO.BoardInsertDTO;
import com.example.board.DTO.ComCode;
import com.example.board.Service.BoardService;

@Controller
@RequestMapping("/")
//@RequiredArgsConstructor
public class BoardController {

	@Autowired
	private BoardService boardService;	
	
	@GetMapping(value = {"{page}/{pageCount}","/"})
	public String home(Model model, @PathVariable(required = false) String page, @PathVariable(required = false) String pageCount) {
		List<BoardDTO> boards = boardService.getBoardDto();
		List<ComCode> com = boardService.getComCode();
		String tempPage = (page == null) ? "1" : page;
		String tempCount = (pageCount == null) ? "5" : pageCount;
		
		System.out.println(tempPage);
		System.out.println(tempCount);
		
		model.addAttribute("comCode", com);
		model.addAttribute("board", boards);
		model.addAttribute("page", tempPage);
		model.addAttribute("pageCount", tempCount);
		
		return "board";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(Model model, @RequestBody BoardInsertDTO boardInsertDTO) {
		
		BoardDTO boardDTO = BoardDTO.builder()
				.contents(boardInsertDTO.getContents())
				.title(boardInsertDTO.getTitle())
				.writer(boardInsertDTO.getWriter())
				.dateTime(LocalDateTime.now().toString())
				.build();
		
		boardService.insertBoard(boardDTO);
		
		return "redirect:/";
	}
	
	@GetMapping("/boardWritePopup")
	public String writePopUP(Model model) {
		
		return "write";
	}
	
	@GetMapping("/boardDetail/{id}")
	public String showDetail(Model model, @PathVariable int id) {
		
		BoardDTO boardDTO = boardService.getDetailBoard(id);
		
		model.addAttribute("detailBoard", boardDTO);
		
		return "detailPage";
	}
	
	@PostMapping("/deleteBoard/{id}")
	public String deleteBoard(Model model, @PathVariable int id) {
		
		boardService.deleteBoard(id);
		
		return "redirect:/";
	}
	
	@PostMapping("/selectDeleteBoard")
	public String selectDeleteBoard(Model model, @RequestParam(value="IdList[]") ArrayList<Integer> idList) {
		
		boardService.deleteBoardSelect(idList);
		
		return "redirect:/";
	}
}