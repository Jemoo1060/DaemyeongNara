package com.spring.dm.dao;

import com.spring.dm.dto.SchoolZoneDto;

public interface ISchoolZoneDao {
	
	SchoolZoneDto schZoneSltone(String schulCode);
	
	void schZoneInsert(SchoolZoneDto schoolZoneDto);
	
	void schZoneUpdate(SchoolZoneDto schoolZoneDto);
	
	void schZoneDelete(String schulCode);
	
}
