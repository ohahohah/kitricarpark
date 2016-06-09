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
import com.carpark.member.model.service.MemberParkingServiceImpl;
import com.carpark.util.Encoder;
import com.carpark.util.NumberCheck;
import com.carpark.util.PageNavigator;
import com.carpark.util.StringCheck;

public class AdminParkingListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = StringCheck.nullToBlank(request.getParameter("key"));
		String word = StringCheck.nullToBlank(Encoder.isoToUtf(request.getParameter("word")));
		
		String parkType = request.getParameter("parkType");
		
		if (parkType != null) {
			List<ParkingDetailDto> list = AdminParkingServiceImpl.getAdminParkingService().parkingList(parkType, pg, key, word);
			request.setAttribute("parkingList", list);
				
			PageNavigator navigator = CommonServiceImpl.getCommonService().getPageNavigatorAdminParking(parkType, pg, key, word);
			navigator.setRoot(request.getContextPath());
			navigator.setNavigator("AdminParkingList");
			request.setAttribute("navigator", navigator);
			
			return "/admin/parking/list.jsp";
		
		} else {
			
			return "index.jsp";
		
		}

	}

}
