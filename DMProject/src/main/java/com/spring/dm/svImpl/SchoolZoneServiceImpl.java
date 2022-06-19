package com.spring.dm.svImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.ISchoolZoneTaskDao;
import com.spring.dm.dto.SchoolZoneDto;
import com.spring.dm.iservice.ISchoolZoneService;

@Transactional
@Service("schoolZoneService")
public class SchoolZoneServiceImpl implements ISchoolZoneService {
	
	@Autowired
	private ISchoolZoneTaskDao sztDao;
	
	@Override
	public String noticeOutputSv(Model model) throws Exception {
		ArrayList<SchoolZoneDto> al = sztDao.noticeSltmul();

		if(al.size() == 0) {
			model.addAttribute("ERR", "등록된 준비물 알림글이 없습니다.");
			return "schoolzone";
		} 
		
		model.addAttribute("al", al);			
		
		return "schoolzone";
	}
}
