package com.kh.finalProject.daily.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.daily.model.vo.Bookmark;
import com.kh.finalProject.daily.model.vo.Habit;
import com.kh.finalProject.daily.model.vo.HabitRecord;
import com.kh.finalProject.daily.model.vo.HabitSum;

@Repository("dailyDao")
public class DailyDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertHabit(Habit habit) {
		
		return sqlSessionTemplate.insert("dailyMapper.insertHabit", habit);
	}

	public Habit selectHabit(Habit habit) {
		
		return sqlSessionTemplate.selectOne("dailyMapper.selectHabit", habit);
	}

	public ArrayList<Habit> selectHabitList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitList", id);
	}

	public Habit selectHabitContent(Habit habit) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitContent", habit);
	}

	public int insertHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.insert("dailyMapper.insertHabitRecord", hr);
	}

	public Habit selectHabitNum(Habit habit) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitNum", habit);
	}

	public ArrayList<HabitRecord> selectHabitRecordList(HabitRecord hrd) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordList", hrd);
	}

	public ArrayList<HabitRecord> selectHabitRecordListW(HabitRecord hrw) {

		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListW", hrw);
	}

	public ArrayList<HabitRecord> selectHabitRecordListM(HabitRecord hrm) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListM", hrm);
	}

	
	public ArrayList<HabitRecord> selectHabitRecordListDaily(HabitRecord habit) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListDaily", habit);
	}

	public ArrayList<HabitSum> selectHabitSumList(Habit hs) {
		
		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitSumList", hs);
	}

	public ArrayList<HabitSum> selectHabitMSumList(Habit hsm) {

		return  (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitMSumList", hsm);
	}

	public ArrayList<HabitSum> selectHabitWSumList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitWSumList", id);
	}

	public int updateHabitComment(Habit habit) {

		return sqlSessionTemplate.update("dailyMapper.updateHabitComment", habit);
	}

	public int deleteHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.update("dailyMapper.deleteHabitRecord", hr);
	}

	public int updateHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.update("dailyMapper.updateHabitRecord", hr);
	}

	public ArrayList<HabitRecord> selectHabitRecordListC(HabitRecord hr) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListC", hr);
	}

	public ArrayList<HabitRecord> selectHabitRecordListD(HabitRecord hr) {
		
		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitRecordListD", hr);
	}

	public int deleteHabit(HashMap<String, String> map) {

		return sqlSessionTemplate.update("dailyMapper.deleteHabit", map);
	}

	public HabitRecord selectHabitRecord(HabitRecord hr) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectHabitRecord", hr);
	}

	public ArrayList<Habit> selectGraphData(HashMap<String, String> map) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectHabitGraphData", map);
	}

	public int updateHabit(Habit habit) {

		return sqlSessionTemplate.update("dailyMapper.updateHabit", habit);
	}

	public int insertBookmarkGroup(Bookmark bm) {

		return sqlSessionTemplate.insert("dailyMapper.insertBookmarkGroup", bm);
	}

	public ArrayList<Bookmark> selectBookmarkGroupList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("dailyMapper.selectBookmarkGroupList", id);
	}

	public int deleteBookmark(Bookmark bm) {

		return sqlSessionTemplate.update("dailyMapper.deleteBookmarkGroup", bm);
	}

	public Bookmark selectBookmark(Bookmark bm) {

		return sqlSessionTemplate.selectOne("dailyMapper.selectBookmarkGroup", bm);
	}

	public int updateBookmark(Bookmark bm) {

		return sqlSessionTemplate.update("dailyMapper.updateBookmarkGroup", bm);
	}

}
