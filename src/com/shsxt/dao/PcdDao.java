package com.shsxt.dao;

import java.util.ArrayList;
import java.util.List;

import com.shsxt.po.PCD;

public class PcdDao {

	public List<PCD> findPCDByPid(int pid) {
		List<PCD> list = new ArrayList();
		String sql = "select * from tb_province_city_district where pid = ?";
		List<Object> params = new ArrayList<>();
		params.add(pid);
		list = BaseDao.queryRows(sql, params, PCD.class);
		return list;
	}
	
}
