package com.spring.dm.iservice;

import org.springframework.ui.Model;

import com.spring.dm.dto.SchoolZoneDto;

public interface IAdminSchoolZoneService {
	String adNoticeViewSv(String schulCode, Model model) throws Exception;
	String adNoticeModifySv(SchoolZoneDto schoolZoneDto, Model model) throws Exception;
	String adNoticdRemoveSv(String schulCode, Model model) throws Exception;
}
