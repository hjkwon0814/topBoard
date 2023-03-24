package com.example.board.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.board.DTO.BoardDTO;
import com.example.board.Service.BoardService;

@Controller
@RequestMapping("/")
//@RequiredArgsConstructor
public class BoardController {

	@Autowired
	private BoardService boardService;	
	
	@GetMapping
	public String home(Model model) {
		List<BoardDTO> boards = boardService.getBoardDto();
				
		model.addAttribute("board", boards);
		
		System.out.println(boards.get(0).getDatetime());
		System.out.println(boards.get(0).getTitle());
		
		
		return "board";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(Model model, @RequestParam BoardDTO boardDTO) {
		
		
		
		return "board";		
	}
	
	@GetMapping("/boardWritePopup")
	public String writePopUP(Model model) {
		
		
		
		return "write";
	}
}