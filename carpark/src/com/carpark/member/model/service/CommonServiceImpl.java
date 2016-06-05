package com.carpark.member.model.service;

import java.util.HashMap;
import java.util.Map;

import com.carpark.member.model.dao.CommonDaoImpl;
import com.carpark.util.BoardConstance;
import com.carpark.util.PageNavigator;

public class CommonServiceImpl implements CommonService {
	
	private static CommonService commonService;
	
	static {
		commonService = new CommonServiceImpl();
	}
	
	private CommonServiceImpl(){}

	public static CommonService getCommonService() {
		return commonService;
	}

	@Override
	public int getNextSeq() {
		return CommonDaoImpl.getCommonDao().getNextSeq();
	}
	
	@Override
	public PageNavigator getPageNavigator(String id, int bcode, int pg, String key, String word) {
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("bcode", bcode + "");
		map.put("key", key);
		map.put("word", word);
		
		//순서 주의
		PageNavigator navigator = new PageNavigator();
	
		int newArticleCount = CommonDaoImpl.getCommonDao().newArticleCount(id, bcode);
		int totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCount(map);
		int totalPageCount = (totalArticleCount - 1) / listSize + 1;
		
		
		navigator.setNewArticleCount(newArticleCount);
		navigator.setTotalArticleCount(totalArticleCount);
		navigator.setTotalPageCount(totalPageCount);
		navigator.setPageNo(pg);
		navigator.setNowFirst(pg <= pageSize);
		navigator.setNowEnd((totalPageCount - 1) / pageSize == (pg - 1) / pageSize);
		
		return navigator;
	}
	
	////////////////////////////메소드 통합중 ///////////////////////////////////////

	@Override
	public PageNavigator getPageNavigatorUser(String userId, int pg, String key, String word) {
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("key", key);
		map.put("word", word);
		
		//순서 주의
		PageNavigator navigator = new PageNavigator();
		
		int newArticleCount = CommonDaoImpl.getCommonDao().newArticleCountUser(userId);
		int totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCountUser(map);
		int totalPageCount = (totalArticleCount - 1) / listSize + 1;
		
		
		navigator.setNewArticleCount(newArticleCount);
		navigator.setTotalArticleCount(totalArticleCount);
		navigator.setTotalPageCount(totalPageCount);
		navigator.setPageNo(pg);
		navigator.setNowFirst(pg <= pageSize);
		navigator.setNowEnd((totalPageCount - 1) / pageSize == (pg - 1) / pageSize);
		
		return navigator;
	}
	
	@Override
	public PageNavigator getPageNavigatorReceiver(String receiveId, int pg, String key, String word) {
		int listSize = BoardConstance.BOARD_LIST_SIZE;
		int pageSize = BoardConstance.BOARD_PAGE_SIZE;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("receiveId", receiveId);
		map.put("key", key);
		map.put("word", word);
		
		//순서 주의
		PageNavigator navigator = new PageNavigator();
		
		int newArticleCount = CommonDaoImpl.getCommonDao().newArticleCountReceiver(receiveId);
		int totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCountReceiver(map);
		int totalPageCount = (totalArticleCount - 1) / listSize + 1;
		
		
		navigator.setNewArticleCount(newArticleCount);
		navigator.setTotalArticleCount(totalArticleCount);
		navigator.setTotalPageCount(totalPageCount);
		navigator.setPageNo(pg);
		navigator.setNowFirst(pg <= pageSize);
		navigator.setNowEnd((totalPageCount - 1) / pageSize == (pg - 1) / pageSize);
		
		return navigator;
	}

	@Override
	public int getNextParkingId() {
		return CommonDaoImpl.getCommonDao().getNextParkingId();
	}

}
