package com.healing.memberMypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.memberMypage.dao.MemberMypageDao;

@Component
public class MemberMypageServiceImp implements MemberMypageService {
	
	@Autowired
	private MemberMypageDao memberMypageDao;
}
