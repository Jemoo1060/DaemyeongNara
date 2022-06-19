package com.spring.dm.svImpl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.dm.dao.IBbDao;
import com.spring.dm.dao.IBbTaskDao;
import com.spring.dm.dao.IBbaDao;
import com.spring.dm.dao.IBbiDao;
import com.spring.dm.dao.IMaxDao;
import com.spring.dm.dao.IProductDao;
import com.spring.dm.dto.BbDto;
import com.spring.dm.dto.BbaDto;
import com.spring.dm.dto.BbiDto;
import com.spring.dm.dto.MemberDto;
import com.spring.dm.dto.ProductDto;
import com.spring.dm.iservice.IBbService;

@Service("bbService")
public class BbServiceImpl implements IBbService {
	
	@Autowired
	IBbTaskDao bbTaskDao;
	@Autowired
	IBbDao bbDao;
	@Autowired
	IBbiDao bbiDao;
	@Autowired
	IBbaDao bbaDao;
	@Autowired
	IMaxDao maxDao;	
	@Autowired
	IProductDao productDao;

	@Override
	public String bbListOutputSv(String bbiCode,String pageNo,String cutPageNo,String err, Model model) throws Exception {
		
		int nPageNo;
		int nCutPageNo;
		
		if(pageNo == null || pageNo == "")
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || cutPageNo == "")
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 10;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("bbiCode", bbiCode);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		ArrayList<HashMap<String, Object>>  list = bbTaskDao.bbSltmul(hm);
		ArrayList<String> dateList = new ArrayList<>();
		ArrayList<BbDto> bbList = new ArrayList<>();
		ArrayList<MemberDto> mbrList = new ArrayList<>();
		for(int i=0; i < list.size(); i++) {
			HashMap<String, Object> bbInfohm  = list.get(i);	
			BbDto bbdto = (BbDto)bbInfohm.get("bb");
			MemberDto memberDto = (MemberDto)bbInfohm.get("member");
			bbdto.getBbRegistDate();
			String regDate = bbdto.getBbRegistDate(); 
			regDate = regDate.substring(0, 4) + "-" + regDate.substring(4,6) + "-" + regDate.substring(6,8);
			dateList.add(regDate);
			bbList.add(bbdto);
			mbrList.add(memberDto);
		}
		
		int maxBb = bbTaskDao.bbPaging(bbiCode);
		
		int maxPage = (maxBb%MAX_ROWS == 0)?maxBb/MAX_ROWS : maxBb/MAX_ROWS+1; 
		
		
		model.addAttribute("bbList", bbList);
		model.addAttribute("mbrList", mbrList);
		model.addAttribute("bbiCode", bbiCode);
		model.addAttribute("dateList",dateList);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		model.addAttribute("err", err);
		
		String viewName;
		if("1".equals(bbiCode)) {
			viewName = "infoBoardInquiry";
		}
		else if("2".equals(bbiCode)) {
			viewName = "reviewBoardInquiry";
		}
		else {
			viewName = "questionBoardInquiry";
		}
		
		return viewName;
	}

	@Override
	public String bbTitleSearchSv(String bbiCode, String bbTitl,String pageNo, String cutPageNo, Model model) throws Exception {
		
		int nPageNo;
		int nCutPageNo;
		
		if(pageNo == null || "".equals(pageNo))
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || "".equals(cutPageNo))
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 7;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		String subBbTitl = "%" + bbTitl + "%";
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("bbiCode", bbiCode);
		hm.put("bbTitl", subBbTitl);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		
		ArrayList<HashMap<String, Object>> list =  bbTaskDao.bbTitleSltmul(hm);
	
		ArrayList<String> dateList = new ArrayList<>();
		ArrayList<BbDto> bbList = new ArrayList<>();
		ArrayList<MemberDto> mbrList = new ArrayList<>();
		for(int i=0; i < list.size(); i++) {
			HashMap<String, Object> bbInfohm = list.get(i);
			BbDto bbdto = (BbDto)bbInfohm.get("bb");
			MemberDto memberDto = (MemberDto)bbInfohm.get("member");
			bbdto.getBbRegistDate();
			String regDate = bbdto.getBbRegistDate(); 
			regDate = regDate.substring(0, 4) + "-" + regDate.substring(4,6) + "-" + regDate.substring(6,8);
			dateList.add(regDate);
			bbList.add(bbdto);
			mbrList.add(memberDto);
		}
		
		int maxBb = bbTaskDao.bbTitlePaging(hm);
		
		int maxPage = (maxBb%MAX_ROWS == 0)?maxBb/MAX_ROWS : maxBb/MAX_ROWS+1; 
		
		model.addAttribute("bbList", bbList);
		model.addAttribute("mbrList", mbrList);
		model.addAttribute("bbiCode", bbiCode);
		model.addAttribute("dateList",dateList);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		
		String viewName;
		if("1".equals(bbiCode)) {
			viewName = "infoBoardSearch";
		}
		else if("2".equals(bbiCode)) {
			viewName = "reviewBoardSearch";
		}
		else {
			viewName = "questionBoardSearch";
		}
		
		return viewName;
	}
	
	@Override
	public String bbPrdListSv(String bbiCode, String prdCode, String chk, String pageNo, String cutPageNo, Model model) throws Exception {
		
		
		int nPageNo;
		int nCutPageNo;
		
		if(pageNo == null || "".equals(pageNo))
			nPageNo = 1;
		else
			nPageNo = Integer.parseInt(pageNo);
		
		if(cutPageNo == null || "".equals(cutPageNo))
			nCutPageNo = 1;
		else
			nCutPageNo = Integer.parseInt(cutPageNo);
		
		
		final int MAX_ROWS = 7;
		
		int startRow = (nPageNo-1)*MAX_ROWS+1;
		int maxRows = MAX_ROWS;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("bbiCode", bbiCode);
		hm.put("prdCode", prdCode);
		hm.put("startRow", startRow);
		hm.put("maxRows", maxRows);
		
		
		ArrayList<HashMap<String, Object>> list =  bbTaskDao.bbPrdSltmul(hm);
	
		ArrayList<String> dateList = new ArrayList<>();
		ArrayList<BbDto> bbList = new ArrayList<>();
		ArrayList<MemberDto> mbrList = new ArrayList<>();
		for(int i=0; i < list.size(); i++) {
			HashMap<String, Object> bbInfohm = list.get(i);
			BbDto bbdto = (BbDto)bbInfohm.get("bb");
			MemberDto memberDto = (MemberDto)bbInfohm.get("member");
			bbdto.getBbRegistDate();
			String regDate = bbdto.getBbRegistDate(); 
			regDate = regDate.substring(0, 4) + "-" + regDate.substring(4,6) + "-" + regDate.substring(6,8);
			dateList.add(regDate);
			bbList.add(bbdto);
			mbrList.add(memberDto);
		}
		
		int maxBb = bbTaskDao.bbPrdPaging(hm);
		
		int maxPage = (maxBb%MAX_ROWS == 0)?maxBb/MAX_ROWS : maxBb/MAX_ROWS+1; 
		
		model.addAttribute("bbList", bbList);
		model.addAttribute("mbrList", mbrList);
		model.addAttribute("bbiCode", bbiCode);
		model.addAttribute("prdCode", prdCode);
		model.addAttribute("chk", chk);
		model.addAttribute("dateList",dateList);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("pageNo", nPageNo);
		model.addAttribute("cutPageNo", nCutPageNo);
		
		String viewName;
		if("1".equals(bbiCode)) {
			viewName = "infoBoardInquiry";
		}
		else if("2".equals(bbiCode)) {
			viewName = "reviewBoardInquiry";
		}
		else {
			viewName = "questionBoardInquiry";
		}
		
		return viewName;
	}
	
	
	@Override
	public String bbInputPageSv(String bbiCode, String prdCode, Model model) throws Exception {
		
		
		if(!(prdCode == null || "".equals(prdCode))){
			ProductDto productDto = productDao.prdSltOne(prdCode);
			model.addAttribute("productDto", productDto);
		}
		
		model.addAttribute("bbiCode", bbiCode);
		
		String viewName;
			
		if("1".equals(bbiCode)) 
			viewName = "infoBoardWrite";
		else if("2".equals(bbiCode))
			viewName = "reviewBoardWrite";
		else
			viewName = "questionBoardWrite";
		
		return viewName;
	}
	
	
	@Override
	@Transactional
	public String bbInputSv(BbDto bbDto,BbiDto bbiDto,String prdName, Model model) throws Exception {
		
		String prdCode = bbDto.getPrdCode();
		String bbTitl = bbDto.getBbTitl();
		char bbOthbcAt = bbDto.getBbOthbcAt();
		char bbiCode = bbDto.getBbiCode();
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	
		
		String maxbb = maxDao.maxBbNum(bbiCode);
		
		int maxbbNum = 0;
		
		if(maxbb == null) {
			maxbbNum = 1;
		} else {
			maxbbNum = Integer.parseInt(maxbb) + 1;
		}
		
		bbDto.setBbNum(String.valueOf(maxbbNum));
		
		if(prdCode == null || "".equals(prdCode)) {
			bbDto.setPrdCode("NO");
		} else {
			bbDto.setPrdCode(prdCode);
			bbTitl = prdName + " : " + bbTitl ;
			bbDto.setBbTitl(bbTitl);
		}
		
		bbDto.setBbRdcnt(1);
		bbDto.setBbRegistDate(now.format(formatter));
		
		if("Y".equals(String.valueOf(bbOthbcAt))) {
			bbDto.setBbOthbcAt(bbOthbcAt);
			bbDto.setBbPwd("NO");
		} else {
			bbDto.setBbOthbcAt(bbOthbcAt);
			bbDto.setBbPwd(bbDto.getBbPwd());
		}

		bbiDto.setBbiCode(bbiCode);
		
		bbiDto.setBbNum(String.valueOf(maxbbNum));
		bbiDto.setBbImageCode("01");
		// 나중에 수정혀 
		bbiDto.setBbImageUrl("NO");
			
		if(bbDao.bbSltone(bbDto) != null) {
			model.addAttribute("err", "이미 등록된 게시글 입니다");
			return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
		}
		
		if(bbiDao.bbImgSltone(bbiDto) != null) {
			model.addAttribute("err", "이미 등록된 게시판사진 입니다");
			return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
		}
		
		
		bbDao.bbInsert(bbDto);
		bbiDao.bbImgInsert(bbiDto);
		
		if(!(prdCode == null || "".equals(prdCode))) {
			return "redirect:/info_boardPrdList?bbiCode="+ bbDto.getBbiCode()+ "&prdCode=" + prdCode;
		}
		
		return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
	}
	
	@Override
	public String bbPwdChk(BbDto bbDto, String writerId, String pageNo, String cutPageNo, Model model) throws Exception {
		
		String bbPwd = bbTaskDao.bbPwdCheck(bbDto);
		
		model.addAttribute("writerId", writerId);
		model.addAttribute("bbiCode", bbDto.getBbiCode());;
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("cutPageNo", cutPageNo);
		
		String viewName = null;
		if(bbDto.getBbPwd().equals(bbPwd))
			viewName = "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		else {
			viewName = "redirect:/info_boardList";
			model.addAttribute("err", "잘못된 비밀번호입니다");
		}
				
		return viewName;
	}
	
	
	@Override
	@Transactional
	public String bbOneOutputSv(BbDto bbDto, String writerId, String chk,String pageNo, String cutPageNo, Model model) throws Exception {
		
		HashMap<String, Object> hm = bbTaskDao.bbInfoPrint(bbDto);
		
		if(hm == null) {
			model.addAttribute("ERR", "존재하지 않는 게시글 입니다.");
			return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
		}
		
		BbDto bbdto = (BbDto)hm.get("bb");
		BbiDto bbidto = (BbiDto)hm.get("bbi");;
		
		int cnt = bbdto.getBbRdcnt();
		bbdto.setBbRdcnt(cnt + 1);
		
		bbTaskDao.bbRdcntUpdate(bbdto);
		
		String regDate = bbdto.getBbRegistDate(); 
		
		if(regDate.length() == 8) {
			regDate = regDate.substring(0, 4) + "-" + regDate.substring(4,6) + "-" + regDate.substring(6,8);
		}

		
		ArrayList<HashMap<String, Object>> list = bbTaskDao.bbaInfoPrint(bbDto);
		ArrayList<BbaDto> bbaList = new ArrayList<>();
		ArrayList<MemberDto> mbrList = new ArrayList<>();
		ArrayList<String> answerDtList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> bbaInfohm = list.get(i);
			BbaDto bbaDto = (BbaDto)bbaInfohm .get("bba");
			MemberDto memberDto = (MemberDto)bbaInfohm .get("member");
			bbaList.add(bbaDto);
			mbrList.add(memberDto);
			String answerDate = bbaDto.getAnswerDate(); 
			answerDate = answerDate.substring(0, 4) + "-" + answerDate.substring(4,6) + "-" + answerDate.substring(6,8);
			answerDtList.add(answerDate);
		}
		
		
		
		model.addAttribute("bbdto", bbdto);
		model.addAttribute("writerId", writerId);
		model.addAttribute("chk", chk);
		model.addAttribute("regDate", regDate);
		model.addAttribute("bbidto", bbidto);
		model.addAttribute("bbaList", bbaList);
		model.addAttribute("mbrList", mbrList);
		model.addAttribute("answerDtList", answerDtList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("cutPageNo", cutPageNo);
		
		String viewName;
		if("1".equals(String.valueOf(bbdto.getBbiCode()))) {
			viewName = "infoBoardContent";
		}
		else if("2".equals(String.valueOf(bbdto.getBbiCode()))) {
			viewName = "reviewBoardContent";
		}
		else {
			viewName = "questionBoardContent";
		}
		
		return viewName;
	}

	@Override
	@Transactional
	public String answerInputSv(BbaDto bbaDto,BbDto bbDto,String writerId,String chk, Model model) throws Exception {

		String maxbba = maxDao.maxBbaNum();
		int bbaNum = 0;
		if(maxbba == null) {
			bbaNum = 1;
		} else {
			bbaNum = Integer.parseInt(maxbba) + 1;
		}
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		bbaDto.setAnswerNum(String.valueOf(bbaNum));
		bbaDto.setAnswerDate(now.format(formatter));
		
		model.addAttribute("writerId", writerId);
		model.addAttribute("prdCode", bbDto.getPrdCode());
		model.addAttribute("chk", chk);
		
		if(bbaDao.answerSltone(bbaDto.getAnswerNum()) != null ) {
			model.addAttribute("err", "이미 등록된 댓글 입니다");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}
		
		bbaDao.answerInsert(bbaDto);		
		
		return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		
	}
	
	@Override
	@Transactional
	public String answerUpdateSv(BbaDto bbaDto,BbDto bbDto,String writerId,String chk, Model model) throws Exception {
		
		model.addAttribute("writerId", writerId);
		model.addAttribute("chk", chk);
		
		if(bbaDao.answerSltone(bbaDto.getAnswerNum()) == null ) {
			model.addAttribute("err", "존재하지 않는 댓글 입니다");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}
		
		bbaDao.answerUpdate(bbaDto);
		
		return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
	}
	
	@Override
	@Transactional
	public String answerDeleteSv(String answerNum, BbDto bbDto,String writerId,String chk, Model model) throws Exception {
				
		model.addAttribute("writerId", writerId);
		model.addAttribute("chk", chk);
		
		if(bbaDao.answerSltone(answerNum) == null ) {
			model.addAttribute("err", "존재하지 않는 댓글 입니다");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}
		
		bbaDao.answerDelete(answerNum);
		
		
		return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
	}
	
	
		
	@Override
	public String bbDefaultInfoSv(BbDto bbDto,String pageNo, String cutPageNo, Model model) throws Exception {
		
		BbDto bbdto = bbDao.bbSltone(bbDto);
		
		if(bbDao.bbSltone(bbDto) == null) {
			model.addAttribute("err", "존재하지 않는 게시글 입니다");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}
		
		model.addAttribute("cutPageNo", cutPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("bbDto", bbdto);
		
		String viewName;
		if("1".equals(String.valueOf(bbdto.getBbiCode()))) {
			viewName = "infoBoardUpdate";
		}
		else if("2".equals(String.valueOf(bbdto.getBbiCode()))) {
			viewName = "reviewBoardUpdate";
		}
		else {
			viewName = "questionBoardUpdate";
		}
		
		return viewName;
	}
	

	@Override
	@Transactional
	public String bbModifySv(BbDto bbDto,BbiDto bbiDto,String writerId, String pageNo, String cutPageNo, Model model) throws Exception {
		
		BbDto bbdto = bbDao.bbSltone(bbDto);
		
		model.addAttribute("writerId", writerId);
		
		if(bbdto == null) {
			model.addAttribute("err", "존재하지 않는 게시글입니다.");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}

		bbiDto.setBbImageCode("01");;
		BbiDto bbidto = bbiDao.bbImgSltone(bbiDto);
		
		if(bbidto == null) {
			model.addAttribute("err", "존재하지 않는 사진입니다.");
			return "redirect:/info_boardContent?bbiCode=" + bbDto.getBbiCode() + "&bbNum=" + bbDto.getBbNum();
		}
		
		String prdCode = bbDto.getPrdCode();
		char bbOthbcAt = bbDto.getBbOthbcAt();
		
		if(prdCode == null || "".equals(prdCode)) {
			bbdto.setPrdCode("NO");
		} else {
			bbdto.setPrdCode(prdCode);
		}
		
		
		if("Y".equals(String.valueOf(bbOthbcAt))) {
			bbdto.setBbOthbcAt(bbOthbcAt);
			bbdto.setBbPwd("NO");
		} else {
			bbdto.setBbOthbcAt(bbOthbcAt);
			bbdto.setBbPwd(bbDto.getBbPwd());
		}
		
		bbdto.setBbTitl(bbDto.getBbTitl());
		bbdto.setBbCn(bbDto.getBbCn());

		// 나중에 수정혀 
		bbidto.setBbImageUrl("NO");
		
		
		
		
		bbDao.bbUpdate(bbdto);
		bbiDao.bbImgUpdate(bbidto);
		
		model.addAttribute("cutPageNo", cutPageNo);
		model.addAttribute("pageNo", pageNo);
		
					
		return "redirect:/info_boardContent?bbiCode=" + bbdto.getBbiCode() + "&bbNum=" + bbdto.getBbNum();
	}

	@Override
	@Transactional
	public String bbImgReMoveSv(BbiDto bbiDto, Model model) throws Exception {
		
		if(bbiDao.bbImgSltone(bbiDto) == null) {
			model.addAttribute("err", "존재하지 않는 게시글 사진입니다.");
			return "";
		}
		
		bbiDao.bbImgDelete(bbiDto);
		
		return "제거 완료후 넘어갈 창";
	}

	@Override
	@Transactional
	public String bbImgAddSv(BbiDto bbiDto, Model model) throws Exception {
		
		if(bbiDao.bbImgSltone(bbiDto) != null) {
			model.addAttribute("err", "이미 등록된 게시글 사진입니다.");
			return "";
		}
		
		bbiDao.bbImgInsert(bbiDto);
		
		return "이미지 등록 후 넘어갈 창";
	}

	@Override
	@Transactional
	public String bbRemoveSv(BbDto bbDto, Model model) throws Exception {
		
		BbDto bbdto = bbDao.bbSltone(bbDto);
		
		
		if(bbdto == null) {
			model.addAttribute("err", "존재하지 않는 게시글입니다.");
			return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
		}
		
		bbDao.bbDelete(bbDto);
		
		
		if(bbdto.getPrdCode() == null || bbdto.getPrdCode() == "") {
			return "redirect:/info_boardList?bbiCode="+ bbDto.getBbiCode();
		}
		
		
		return "redirect:/info_boardPrdList?bbiCode="+ bbDto.getBbiCode() + "&prdCode=" + bbdto.getPrdCode();
	}

	@Override
	public String bbPclSearchSv(String prdName, Model model) throws Exception {
		
		ArrayList<HashMap<String, Object>> list = bbTaskDao.prdNameSearch(prdName);
		
		ArrayList<BbDto> bbList = new ArrayList<>();
		ArrayList<ProductDto> prdList = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hm = list.get(i);
			BbDto bbDto = (BbDto)hm.get("bb");
			ProductDto productDto= (ProductDto)hm.get("product");
			bbList.add(bbDto);
			prdList.add(productDto);
		}

		model.addAttribute("bbList", bbList);
		model.addAttribute("prdList", prdList);
		
		return "게시판 제품명으로 검색 결과창";
	}
}