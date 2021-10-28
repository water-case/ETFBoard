package com.myboard.etfboard.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboard.etfboard.board.service.BoardService;
import com.myboard.etfboard.board.vo.BoardVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value="/board" ,method = RequestMethod.GET)
	public ModelAndView BoardFirstList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 첫 페이지 글 목록 전송
		List boardList = boardService.FirstList();
		mav.addObject("boardList", boardList);
		mav.addObject("nowPage", 1);
		mav.addObject("startPageIndex", 0);
		// 전체 글 개수 조회
		int totalIndexCount = boardService.GetIndexCount();
		mav.addObject("totalIndexCount", 1+(totalIndexCount-1)/15);
		mav.setViewName("/board");
		return mav;
	}
	
	// 요청한 페이지대로 조회
	@Override
	@RequestMapping(value="/board/page*" ,method = RequestMethod.GET)
	public ModelAndView BoardPageList(@RequestParam("page") int page, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 페이지별 글 목록 전송
		List boardList = boardService.PageList(page);
		mav.addObject("boardList", boardList);
		mav.addObject("nowPage", page);
		mav.addObject("startPageIndex", (page-1)/5);
		// 전체 글 개수 조회후 Page 바인딩
		int totalIndexCount = boardService.GetIndexCount();
		mav.addObject("totalIndexCount", 1+(totalIndexCount-1)/15);
		mav.setViewName("/board");
		return mav;
	}
	
	// 글쓰기 폼
	@Override
	@RequestMapping(value="/board/write" ,method = RequestMethod.GET)
	public ModelAndView BoardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/write");
		return mav;
	}
	
	// 글쓰기
	@Override
	@RequestMapping(value="/board/write.do" ,method = RequestMethod.POST)
	public ModelAndView DoBoardWrite(@ModelAttribute("board") BoardVO board, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// DB에 글 내용 전송
		int result = boardService.writeContents(board);
		if(result == 1) {
			rAttr.addAttribute("result","writeSuccess");
			mav.setViewName("redirect:/board");
		}
		else {
			rAttr.addAttribute("result","writeFail");
			mav.setViewName("redirect:/board");
		}
		return mav;
	}
	
	// 글 내용 조회
	@Override
	@RequestMapping(value="/board/contents*" ,method = RequestMethod.GET)
	public ModelAndView ViewBoardContents(@RequestParam("index") int boardIndex, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// DB에 인덱스를 보내서 글 내용 조회
		BoardVO boardContents = boardService.getContents(boardIndex);
		
		if(boardContents != null) {
			// 조회 성공 시 mav에 바인딩
			mav.addObject("boardContents", boardContents);
		} else {
			// 조회 실패 시 '삭제되었거나 잘못된 접근입니다' 노출 후 리다이렉트			
		}
		mav.setViewName("/board/contents");
		return mav;
	}
	
	// 글 내용 수정 폼
	@Override
	@RequestMapping(value="/board/update*" ,method = RequestMethod.GET)
	public ModelAndView UpdateBoardContents(@RequestParam("index") int boardIndex, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		BoardVO boardContents = boardService.getContents(boardIndex);
		mav.addObject("boardContents",boardContents);
		mav.setViewName("/board/update");
		
		return mav;
	}
	
	// 글 내용 수정
	@Override
	@RequestMapping(value="/board/update.do" ,method = RequestMethod.POST)
	public ModelAndView DoUpdateBoardContents(@ModelAttribute("board") BoardVO board, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		// DB에 수정한 글 내용 전송
		int result = boardService.updateContents(board);
		if(result == 1) {
			rAttr.addAttribute("result","updateSuccess");
		} else {
			rAttr.addAttribute("result","updateFail");
		}
		mav.setViewName("redirect:/board/contents?index=" + board.getBoardIndex());
		return mav;
	}

	@Override
	@RequestMapping(value="/board/delete*" ,method = RequestMethod.GET)
	public ModelAndView DeleteBoardContents(@RequestParam("index") int boardIndex, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		int result = boardService.DeleteContents(boardIndex);
		if(result == 1) {
			rAttr.addAttribute("result","deleteSuccess");
		} else {
			rAttr.addAttribute("result","deleteFail");
		}
		mav.setViewName("redirect:/board");
		return mav;
	}
	
	// 글 삭제
	
}
