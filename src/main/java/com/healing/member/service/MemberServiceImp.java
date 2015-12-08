package com.healing.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.member.dao.MemberDao;
import com.healing.member.dto.InterestDto;
import com.healing.member.dto.MemberDto;

/**
 * @이름 : MemberServiceImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김진수
 * @설명 : 회원관리 Service
 */
@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public void memberJoin(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		
		mav.setViewName("member/memberJoin");
	}

	@Override
	public void memberJoinOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		InterestDto interestDto=(InterestDto)map.get("interestDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String nomal="nomal";				// 회원 기본등급 노말 설정
		memberDto.setMember_date(new Date()); // 가입날짜
		memberDto.setMember_level(nomal);	// 회원 기본등급 노말 설정
		
		// String member_id=memberDto.getMember_id();  // 입력받는 아이디
		int check=memberDao.memberInsert(memberDto);         // 회원정보 인설트
		// HomeAspect.logger.info(HomeAspect.logMsg+"입력받는 아이디:"+member_id);
		
		MemberDto memberList=memberDao.memberSelect(memberDto);  // 회원정보 불러오기
		int member_number=memberList.getMember_number();         // 회원번호
		// HomeAspect.logger.info(HomeAspect.logMsg+"멤버셀렉트 넘버:"+member_number);
		String interest=interestDto.getInterest_content(); // 관심정보
		          
		if(check>0 && interest!=null){     // 만약 회원가입이 정상적으로 이루어지고 관심여행지를 선택했다면
			String result[]=interest.split(",");     // 스플릿으로 하나씩 뽑는다
			for(int i=0;i<result.length;i++){              // 선택한 모든 관심정보를 for문으로 하나씩 넣는다
				String interest_content=result[i];
				int value=memberDao.InterestInsert(interest_content,member_number); // 관심정보를 DB에 넣는다.
				// HomeAspect.logger.info(HomeAspect.logMsg+"관심여행지 체크:"+value);
			}
		}
		
		// HomeAspect.logger.info(HomeAspect.logMsg+"관심여행지:"+interest.length());
		
		mav.addObject("check",check);
		mav.setViewName("member/memberJoinOk");
	}

	@Override
	public void memberIdCheck(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		String member_id=request.getParameter("id");
		// HomeAspect.logger.info(HomeAspect.logMsg+member_id);
		
		int check=memberDao.memberIdCheck(member_id);
		// HomeAspect.logger.info(HomeAspect.logMsg+"아이디체크:"+check);
		
		if(check>0){
			
			String str="same";
			
			try {
				response.setContentType("application/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(str);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(check==0){
			
			String str="ok";
			
			try {
				response.setContentType("application/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(str);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void memberLogin(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		
		String member_id=request.getParameter("id");
		String member_password=request.getParameter("password");
		// HomeAspect.logger.info(HomeAspect.logMsg+"로그인아이디비번:"+member_id+","+member_password);
		MemberDto memberDto=memberDao.memberLoginCheck(member_id,member_password);
		// int member_number=memberDto.getMember_number();
		// String id=memberDto.getMember_id();
		// HomeAspect.logger.info(HomeAspect.logMsg+"로그인체크:"+member_number+","+id);
		mav.addObject("memberDto",memberDto);
		mav.setViewName("home");
	}

	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String member_id=request.getParameter("member_id");
		
		mav.addObject("member_id",member_id);
		mav.setViewName("member/memberDelete");
	}

	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String member_id=request.getParameter("member_id");
		String member_password=request.getParameter("member_password");
		// HomeAspect.logger.info(HomeAspect.logMsg+"탈퇴할 아이디 비번:"+member_id+","+member_password);
		int member_delete=1;
		
		int check=memberDao.memberDelete(member_id,member_password, member_delete);
		// HomeAspect.logger.info(HomeAspect.logMsg+"탈퇴체크:"+check);
		
		mav.addObject("check",check);
		mav.setViewName("member/memberDeleteOk");
	}

	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String member_id=request.getParameter("member_id");
		int member_number=Integer.parseInt(request.getParameter("member_number"));
		
		List<InterestDto> interestList=null;
		MemberDto memberDto=memberDao.memberSelect2(member_id);
		interestList=memberDao.interestSelect(member_number);
		
		// String member_eamil=memberDto.getMember_email();
		// HomeAspect.logger.info(HomeAspect.logMsg+"수정이메일:"+member_eamil);
		// HomeAspect.logger.info(HomeAspect.logMsg+"수정회원번호:"+member_number);
		// String interest=interestDto.getInterest_content();
		// HomeAspect.logger.info(HomeAspect.logMsg+"수정관심:"+interest);
		
		mav.addObject("memberDto",memberDto);
		mav.addObject("interestList",interestList);
		
		mav.setViewName("member/memberUpdate");
	}
}
