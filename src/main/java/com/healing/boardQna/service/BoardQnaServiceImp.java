package com.healing.boardQna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.boardQna.dao.BoardQnaDao;

@Component
public class BoardQnaServiceImp implements BoardQnaService {
	@Autowired
	private BoardQnaDao boardQnaDao;
}
