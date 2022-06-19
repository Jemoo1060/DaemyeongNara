package com.spring.dm.svImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.ISchoolZoneDao;
import com.spring.dm.dto.SchoolZoneDto;
import com.spring.dm.iservice.IAdminSchoolZoneService;

@Transactional
@Service("adminSchoolZoneService")
public class AdminSchoolZoneServiceImpl implements IAdminSchoolZoneService {
	
	@Autowired
	ISchoolZoneDao schoolZoneDao;
	
	@Override
	public String adNoticeViewSv(String schulCode, Model model) throws Exception {
		SchoolZoneDto schoolZoneDto = schoolZoneDao.schZoneSltone(schulCode);
		
		if(schoolZoneDto == null) {
			model.addAttribute("ERR", "존재하지 않는 학년반입니다.");
			return "schoolReady";
		}
		
		model.addAttribute("schoolZoneDto", schoolZoneDto);
		
		return "schoolReady";
	}
	
	@Override
	public String adNoticeModifySv(SchoolZoneDto schoolZoneDto, Model model) throws Exception {
		String schulCode = schoolZoneDto.getSchulCode();
		
		System.out.println();
		System.out.println();
		System.out.println(schulCode);
		System.out.println();
		System.out.println();
		
		SchoolZoneDto sltSchoolZoneDto = schoolZoneDao.schZoneSltone(schulCode);
		
		if(sltSchoolZoneDto == null) {
			model.addAttribute("ERR", "존재하지않는 코드입니다.");
			return "adminSchoolzone";
		}
		
		schoolZoneDao.schZoneUpdate(schoolZoneDto);
		
		return "adminSchoolzone";
	}
	
	@Override
	public String adNoticdRemoveSv(String schulCode, Model model) throws Exception {
		SchoolZoneDto sltSchoolZoneDto = schoolZoneDao.schZoneSltone(schulCode);
		
		if(sltSchoolZoneDto == null) {
			model.addAttribute("ERR", "존재하지않는 코드입니다.");
			return "adminSchoolzone";
		}
		
		sltSchoolZoneDto.setSchulMsg("");
		
		schoolZoneDao.schZoneUpdate(sltSchoolZoneDto);
		
		return "adminSchoolzone";
	}
}
