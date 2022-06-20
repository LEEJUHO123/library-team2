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

public class NowRentalListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RentalService dao = new RentalServiceImpl();
		List<RentalVO> rentalNowList = new ArrayList<RentalVO>();
		HttpSession session = request.getSession();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowDate = simpleDate.format(now);
		int sysMonth = Integer.parseInt(nowDate.substring(5,7));
		int sysDate = Integer.parseInt(nowDate.substring(8,10));
		rentalNowList = dao.nowRentalList((String) session.getAttribute("id"));
		
		// 0 : 대출중 1 : 반납완료 2: 연체중
		for(int i= 0; i<rentalNowList.size(); i++) {
			int sqlMonth = 0;
			int sqlDate = 0;
			sqlMonth = rentalNowList.get(i).getReturnDate().getMonth() + 1;
			sqlDate = rentalNowList.get(i).getReturnDate().getDate();
			int returnBook = rentalNowList.get(i).getReturnOrNot();
			if (returnBook == 0) {
				if(sqlMonth > sysMonth) {
					break;
				}else if(sqlMonth == sysMonth) {
					if(sqlDate < sysDate) {
						rentalNowList.get(i).setReturnOrNot(2);
					}else {
						break;
					}
				}else if(sqlMonth < sysMonth) {
					rentalNowList.get(i).setReturnOrNot(2);
				}
			}
		}
		
		
		request.setAttribute("rentalNowList", rentalNowList);
		return "mypage/nowRentalList";
	}

}
