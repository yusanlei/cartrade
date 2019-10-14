package com.shsxt.service;

import java.util.List;

import com.shsxt.dao.PcdDao;
import com.shsxt.po.PCD;

public class PcdService {

	private PcdDao pcdDao = new PcdDao();
	
	public List<PCD> findPCDByPid(int pid) {
		return pcdDao.findPCDByPid(pid);
	}
	
}
