package co.team.library.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.team.library.comm.Command;
import co.team.library.member.service.MemberService;
import co.team.library.member.serviceImpl.MemberServiceImpl;
import co.team.library.member.vo.MemberVO;

public class Login implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setTel(request.getParameter("tel"));
		vo.setAddress(request.getParameter("address"));
		
		vo = dao.MemberSelect(vo);
		
		if(vo != null) {
			if(vo.getBlack() == 1) {
				request.setAttribute("message", "블랙리스트 대상자입니다. 관리자에게 문의바랍니다.                        📞Phone :(053)421-2460  /  ✉email : abc@abc.com");
				return "member/loginForm";
			}else {
				session.setAttribute("id", vo.getId());
				session.setAttribute("password", vo.getPassword());
				session.setAttribute("name", vo.getName());
				session.setAttribute("tel", vo.getTel());
				session.setAttribute("address", vo.getAddress());
			}
			return "home.do";
		}
		
		return "member/login";
	}

}
