package com.healing.adminBanner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.healing.adminBanner.dao.AdminBannerDao;

@Component
public class AdminBannerServiceImp implements AdminBannerService {
	@Autowired
	private AdminBannerDao adminInfoDao;
}
