package co.team.library.book.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookVO {
	private String bookCode;
	private String bookTitle;
	private String writer;
	private String publisher;	
	private String category;
	private int rentalCount;
	private int returnOrNot;
	private String image;
	private String story;
}
