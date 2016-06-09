package com.carpark.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.carpark.common.model.ParkingDetailDto;
import com.carpark.member.model.ReservationDto;

public interface AdminParkingService {
	int registerReservation(ParkingDetailDto parkingDetailDto);
	ArrayList<ReservationDto> myReservationList(String user_id); 
	List<ParkingDetailDto> parkingList(String parkType, int pg, String key, String word);
}
