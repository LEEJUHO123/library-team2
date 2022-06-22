package co.team.library.books;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team.library.book.page.BookPage;
import co.team.library.book.service.BookService;
import co.team.library.book.serviceImpl.BookServiceImpl;
import co.team.library.book.vo.BookVO;
import co.team.library.comm.Command;
import co.team.library.qna.page.QnaPage;

public class Books implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//책 리스트
		BookService dao = new BookServiceImpl();
		List<BookVO> books = new ArrayList<BookVO>();
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		
		BookPage page = new BookPage();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "12";
		}

		int totalCount = dao.bookListCount(page);
		page = new BookPage(totalCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		books = dao.books(page);		
		
		request.setAttribute("paging", page);
		request.setAttribute("books", books);
		return "books/books";
	}

}
