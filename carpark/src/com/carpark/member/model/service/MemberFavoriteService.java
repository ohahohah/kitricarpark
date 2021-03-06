package com.carpark.member.model.service;

import java.util.List;

import com.carpark.common.model.ParkingViewDto;
import com.carpark.member.model.FavoriteDto;

public interface MemberFavoriteService {
	void addfavortie(FavoriteDto favoriteDto);			//즐겨찾기 추가
	void delfavortie(FavoriteDto favoriteDto);				//즐겨찾기 삭제
	List<FavoriteDto> favoritelist(String user_id);
	ParkingViewDto getParkingView(int park_id);
	
}
