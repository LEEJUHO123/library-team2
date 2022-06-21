package co.team.library.member.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team.library.comm.Command;
import co.team.library.member.page.BoardPage;
import co.team.library.rental.service.RentalService;
import co.team.library.rental.serviceImpl.RentalServiceImpl;
import co.team.library.rental.vo.RentalVO;

public class RentalList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 대여목록
		RentalService dao = new RentalServiceImpl();
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		
		BoardPage page = new BoardPage();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		int totalCount = dao.boardListCount3();
		page = new BoardPage(totalCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<RentalVO> rentalMemberList = new ArrayList<RentalVO>();

		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowDate = simpleDate.format(now);
		int sysMonth = Integer.parseInt(nowDate.substring(5,7));
		int sysDate = Integer.parseInt(nowDate.substring(8,10));
		
		rentalMemberList = dao.memberRentalList(page);

		// 0 : 대출중 1 : 반납완료 2: 연체중
				for(int i= 0; i<rentalMemberList.size(); i++) {
					int sqlMonth = 0;
					int sqlDate = 0;
					sqlMonth = rentalMemberList.get(i).getReturnDate().getMonth() + 1;
					sqlDate = rentalMemberList.get(i).getReturnDate().getDate();
					int returnBook = rentalMemberList.get(i).getReturnOrNot();
					if (returnBook == 0) {
						if(sqlMonth > sysMonth) {
							
						}else if(sqlMonth == sysMonth) {
							if(sqlDate < sysDate) {
								rentalMemberList.get(i).setReturnOrNot(2);
							}else {
							}
						}else if(sqlMonth < sysMonth) {
							rentalMemberList.get(i).setReturnOrNot(2);
						}
					}
				}
		
		
		
		request.setAttribute("paging", page);
		request.setAttribute("rentalMemberList", rentalMemberList);
		return "administrator/rentalList";
	}

}
