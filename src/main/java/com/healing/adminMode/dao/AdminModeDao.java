package com.healing.adminMode.dao;

import java.util.List;

import com.healing.adminMode.dto.AdminModeDto;

public interface AdminModeDao {
	public int adminModeCreate(AdminModeDto adminModeDto);
	
	public AdminModeDto adminModeLogin(String admin_id,String admin_password);
	
	public List<AdminModeDto> adminModeSelect();
	
	public int adminModeUpdate(AdminModeDto adminModeDto);
	
	public int adminDelete(int admin_number);
}
