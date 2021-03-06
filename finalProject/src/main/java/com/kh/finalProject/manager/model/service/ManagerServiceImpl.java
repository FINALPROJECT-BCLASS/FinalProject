package com.kh.finalProject.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.manager.model.dao.ManagerDao;
import com.kh.finalProject.manager.model.vo.MPageInfo;
import com.kh.finalProject.manager.model.vo.RPageInfo;
import com.kh.finalProject.manager.model.vo.Report;
import com.kh.finalProject.member.model.vo.Member;

@Service("mgService")
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	ManagerDao mgDao;

	@Override
	public int getMemberCount(String id) {
		
		return mgDao.getMemberCount(id);
	}

	@Override
	public ArrayList<Member> selectMList(MPageInfo mpi) {
		
		return mgDao.selectMList(mpi);
	}

	@Override
	public int getReportCount(String id) {
		
		return mgDao.getReportCount(id);
	}

	@Override
	public ArrayList<Report> selectRList(RPageInfo rpi) {
		
		return mgDao.selectRList(rpi);
	}

	@Override
	public int updateReport(Report r) {
		
		return mgDao.updateReport(r);
	}

	@Override
	public int updateRpCount(String id) {
		
		return mgDao.updateRpCount(id);
	}

	@Override
	public int updateChatN(String id) {
		
		return mgDao.updateChatN(id);
	}

	@Override
	public int updateChatY(String id) {
		
		return mgDao.updateChatY(id);
	}

}
