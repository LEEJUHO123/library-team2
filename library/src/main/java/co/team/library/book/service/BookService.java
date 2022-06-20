package co.team.library.book.service;

import java.util.List;

import co.team.library.book.vo.BookVO;
import co.team.library.rental.vo.RentalVO;

public interface BookService {
	List<BookVO> bookList(); // 책 전체 조회
	List<BookVO> searchBookCategory(BookVO vo); // 책 카테고리(총류)별 조회
	List<BookVO> searchBookWriter(BookVO vo); // 책 저자 조회
	List<BookVO> searchTitle(BookVO vo); // 책제목 검색
	List<BookVO> searchKeyword(BookVO vo); // 저자/책제목 검색
	List<BookVO> rentalChart(); // 대여현황
	List<BookVO> categoryChart(); // 카테고리별 대여현황
	BookVO bookDetail(String title);
	
	//메인화면에 노출
	List<RentalVO> bestseller();
	List<RentalVO> categoryBest();
	
	
	// 관리자만 가능한 영역
	BookVO bookInsert(BookVO vo); // 책 등록
	int bookDelete(String bookCode); // 등록된 책 삭제
	

}
