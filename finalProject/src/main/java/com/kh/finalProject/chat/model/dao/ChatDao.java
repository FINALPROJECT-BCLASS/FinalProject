package com.kh.finalProject.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.member.model.vo.Member;

@Repository("cDao")
public class ChatDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Member> selectMember(String name) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectMember",name);
	}
}
