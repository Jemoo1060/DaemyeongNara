package com.spring.dm.svImpl;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IMaxDao;
import com.spring.dm.dao.IMemberDao;
import com.spring.dm.dao.IMemberTaskDao;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.iservice.IMbrJoinService;

@Transactional
@Service("mbrJoinService")
public class MbrJoinServiceImpl implements IMbrJoinService {

	@Autowired
	private IMemberDao mbrDao;
	
	@Autowired
	private IMemberTaskDao mbrTaskDao;
	
	@Autowired
	private IMaxDao maxDao;
	
	@Override
	public String mbrJoinSv(MemberDto memberDto, Model model) throws Exception {
		String mbrCode = String.valueOf((Integer.parseInt(maxDao.maxMbrCode()) + 1));
		
		MemberDto sltoneMemberDto = mbrDao.mbrSltone(mbrCode);
  
		if(sltoneMemberDto != null) {
			model.addAttribute("ERR", "가입에 실패했습니다.");
			return "goJoin";
		}
  
		memberDto.setMbrCode(mbrCode);
		mbrDao.mbrInsert(memberDto);
		
		return "redirect:/goLogin";
	}
	
	@Override
	public String idDuplCheckSv(String mbrId, Model model) throws Exception {
		MemberDto memberDto = mbrTaskDao.idInfoCheck(mbrId);
		
		boolean result = false;
		
		if(memberDto == null) {
			result = true;
		}
		
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();
	}
}
