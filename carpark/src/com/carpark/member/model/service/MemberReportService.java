package com.carpark.member.model.service;

import java.util.List;

import com.carpark.member.model.ReportDto;

public interface MemberReportService {

	int writeArticle(ReportDto reportDto);
	ReportDto viewArticle(int seq);
	List<ReportDto> listArticle(String userId, int pg, String key, String word);
	void deleteArticle(int seq);
	
}
