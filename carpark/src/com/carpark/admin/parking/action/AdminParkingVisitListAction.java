package com.carpark.admin.parking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.action.Action;
import com.carpark.admin.model.service.AdminParkingServiceImpl;
import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.MemberDto;
import com.carpark.member.model.service.CommonServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingVisitListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String act = request.getParameter("act");
		String visit = StringCheck.nullToBlank(request.getParameter("visit"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(request.getParameter("word"));
		String flag = request.getParameter("flag");
		
		System.out.println("key : " + key);
		System.out.println("word : " + word);
		System.out.println("visit : " + visit);

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
		if (memberDto != null) {
			List<ParkingDetailDto> list = AdminParkingServiceImpl.getAdminParkingService().parkingList(pg, key, word,
					visit);
			request.setAttribute("parkingList", list);

			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminParking(pg, key, word,
					visit);
			navigator.setRoot(request.getContextPath());
			navigator.setNavigator("parkAuthList");
			request.setAttribute("navigator", navigator);

			return "/admin/parking/authlist.jsp";
		} else
			return "index.jsp";
	}

}