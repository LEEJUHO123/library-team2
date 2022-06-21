package co.team.library.home;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team.library.book.service.BookService;
import co.team.library.book.serviceImpl.BookServiceImpl;
import co.team.library.book.vo.BookVO;
import co.team.library.comm.Command;
import co.team.library.rental.vo.RentalVO;

public class HomeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		BookService dao = new BookServiceImpl();
		List<BookVO> bestseller = new ArrayList<BookVO>();
		bestseller = dao.bestseller();		
		request.setAttribute("bestseller", bestseller);
		
		List<BookVO> category800 = new ArrayList<BookVO>();
		List<BookVO> category400 = new ArrayList<BookVO>();
		List<BookVO> category600 = new ArrayList<BookVO>();
		List<BookVO> category700 = new ArrayList<BookVO>();
		List<BookVO> category900 = new ArrayList<BookVO>();
		BookVO vo800 = new BookVO();
		BookVO vo400 = new BookVO();
		BookVO vo600 = new BookVO();
		BookVO vo700 = new BookVO();
		BookVO vo900 = new BookVO();
		vo800.setCategory("800");
		vo400.setCategory("400");
		vo600.setCategory("600");
		vo700.setCategory("700");
		vo900.setCategory("900");
		category800 = dao.categoryBest(vo800);
		category400 = dao.categoryBest(vo400);
		category600 = dao.categoryBest(vo600);
		category700 = dao.categoryBest(vo700);
		category900 = dao.categoryBest(vo900);
		
		request.setAttribute("category800", category800);
		request.setAttribute("category400", category400);
		request.setAttribute("category600", category600);
		request.setAttribute("category700", category700);
		request.setAttribute("category900", category900);
		return "home/home";
	}

}
