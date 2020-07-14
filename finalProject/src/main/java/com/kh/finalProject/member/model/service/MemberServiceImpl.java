package com.kh.finalProject.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.member.model.dao.MemberDao;
import com.kh.finalProject.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		
		return mDao.selectMember(m);
	}

	@Override
	public void checkId(String id, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		out.println(mDao.checkId(id));
		out.close();
		
	}
	
}
