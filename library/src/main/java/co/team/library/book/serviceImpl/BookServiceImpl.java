package co.team.library.book.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.team.library.book.page.BookPage;
import co.team.library.book.service.BookMapper;
import co.team.library.book.service.BookService;
import co.team.library.book.vo.BookVO;
import co.team.library.comm.DataSource;

public class BookServiceImpl implements BookService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private BookMapper map = sqlSession.getMapper(BookMapper.class);

	@Override
	public List<BookVO> books(BookPage page) {
		return map.books(page);
	}

	@Override
	public List<BookVO> searchBookCategory(BookVO vo) {
		return map.searchBookCategory(vo);
	}

	@Override
	public List<BookVO> searchBookWriter(BookVO vo) {
		return map.searchBookWriter(vo);
	}

	@Override
	public List<BookVO> searchTitle(BookVO vo) {
		return map.searchTitle(vo);
	}

	@Override
	public BookVO bookInsert(BookVO vo) {
		return map.bookInsert(vo);
	}

	@Override
	public int bookDelete(String bookCode) {
		return map.bookDelete(bookCode);
	}

	@Override
	public List<BookVO> rentalChart() {
		return map.rentalChart();
	}

	@Override
	public List<BookVO> categoryChart() {
		return map.categoryChart();
	}
	
	@Override
	public BookVO bookDetail(String title) {
		return map.bookDetail(title);
	}
	
	@Override
	public List<BookVO> searchKeyword(BookVO vo) {
		return map.searchKeyword(vo);
	}

	@Override
	public List<BookVO> bestseller() {
		return map.bestseller();
	}

	@Override
	public List<BookVO> categoryBest(BookVO vo) {
		return map.categoryBest(vo);
	}

	@Override
	public int bookListCount(BookPage page) {
		return map.bookListCount(page);
	}

}
