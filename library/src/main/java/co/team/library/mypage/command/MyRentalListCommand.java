package co.team.library.mypage.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.team.library.comm.Command;
import co.team.library.rental.service.RentalService;
import co.team.library.rental.serviceImpl.RentalServiceImpl;
import co.team.library.rental.vo.RentalVO;

public class MyRentalListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RentalService dao = new RentalServiceImpl();
		List<RentalVO> rentalList = new ArrayList<RentalVO>();
		HttpSession session = request.getSession();
		rentalList = dao.myRentalList((String) session.getAttribute("id"));
		
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowDate = simpleDate.format(now);
		int sysMonth = Integer.parseInt(nowDate.substring(5,7));
		int sysDate = Integer.parseInt(nowDate.substring(8,10));
		
		// 0 : 대출중 1 : 반납완료 2: 연체중
		for(int i= 0; i<rentalList.size(); i++) {
			int sqlMonth = 0;
			int sqlDate = 0;
			sqlMonth = rentalList.get(i).getReturnDate().getMonth() + 1;
			sqlDate = rentalList.get(i).getReturnDate().getDate();
			int returnBook = rentalList.get(i).getReturnOrNot();
			if (returnBook == 0) {
				if(sqlMonth > sysMonth) {
				}else if(sqlMonth == sysMonth) {
					if(sqlDate < sysDate) {
						rentalList.get(i).setReturnOrNot(2);
					}else {
					}
				}else if(sqlMonth < sysMonth) {
					rentalList.get(i).setReturnOrNot(2);
				}
			}
		}

		request.setAttribute("rentalList", rentalList);
		return "mypage/myRentalList";
	}

}
