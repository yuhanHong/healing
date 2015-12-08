package com.healing.boardQna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.healing.boardQna.service.BoardQnaService;

@Controller
public class BoardQnaController {
	@Autowired
	private BoardQnaService boardQnaService;
}
