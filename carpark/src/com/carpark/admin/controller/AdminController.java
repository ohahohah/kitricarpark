package com.carpark.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.factory.AdminActionFactory;
import com.carpark.util.BoardConstance;
import com.carpark.util.Encoder;
import com.carpark.util.PageMove;

/**
 * Servlet implementation class AdminCallController
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
             
        
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String root = request.getContextPath();
    		String act = Encoder.utfUrl(request.getParameter("act"));
    		System.out.println("act>>>>>>>>>>>>>"+act);
    		String path ="/index.jsp";
    		

    		if("mvprofile".equals(act)) {
    			
    		}else if("adminParkRegister".equals(act)) {
    			path = AdminActionFactory.getAdminParkingRegisterAction().execute(request, response);
    		
    		}else if("alluserinfo".equals(act)) {
    			path = AdminActionFactory.getAdminAllUserInfoAction().execute(request, response);
    			System.out.println("aasdfasd@@"+path);
    			PageMove.forward(request, response, path);
    		}else if("".equals(act)) {
    			
    		}else if("".equals(act)) {
    			
    		}else if("".equals(act)) {
    			
    		}else if("".equals(act)) {
    			
    		}
    		
    	}

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding(BoardConstance.DEFAULT_CHARSET);
    		doGet(request, response);
    	}

}