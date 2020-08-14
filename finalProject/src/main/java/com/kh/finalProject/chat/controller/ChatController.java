package com.kh.finalProject.chat.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.chat.model.service.ChatService;
import com.kh.finalProject.chat.model.vo.Chat;
import com.kh.finalProject.chat.model.vo.openChat;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	ChatService cService;

	@RequestMapping("chatview.do")
	public ModelAndView chatview(ModelAndView mv,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("로그인 아이디" + loginUser.getId());
		
		ArrayList<Member> member = new ArrayList();
		
		member = cService.selectFriendList(loginUser.getId());
		
		System.out.println("member(친구정보) : " + member);
		mv.addObject("freindList", member).setViewName("chat/chatview");
		
		return mv;
	}
	
	@RequestMapping("selectMember.do")
	public void selectMember(HttpSession session,HttpServletResponse response,String name) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		System.out.println("name : " +name);
		
		Member loginMember = (Member)session.getAttribute("loginUser");
		
		String str = loginMember.getId();// 자신의 이름.
		
		System.out.println("str : " + str);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("id", str);
		map.put("nickname", name);
		
		//검색 목록 셀렉 시작
		ArrayList<Member> member = new ArrayList();
		
		member =cService.selectMember(map);
		
		System.out.println("member : " + member);
		
		JSONArray jarr = new JSONArray();
		
		for(Member m : member) {
			JSONObject jMember = new JSONObject();
			
			jMember.put("name", m.getName());
			jMember.put("Rename_file", m.getRename_file());
			jMember.put("nickname", m.getNickname());
			jMember.put("id", m.getId());
			
			jarr.add(jMember);
		}
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("list",jarr);
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("insertFriendList.do")
	public String insertFriendList(HttpSession session,
						@RequestParam(value = "id")String id ) {
		System.out.println(" 받아온 아이디" + id);
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println("로그인 아이디" + loginUser.getId());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("Id", loginUser.getId());
		map.put("friend_id", id);
		
		int result = 0;
		
		result = cService.insertFriendList(map);
		
		if(result >0) {
			return "redirect:chatview.do";
		}else {
			return "<script> alert('친구 추가에 실패했습니다.'); history.back(); </script>";
		}
		
	}
	//수정사항으로 매핑이름이 조금 이상함..
	@RequestMapping("ChatOneToOneView.do")
	public String ChatOneToOneView(HttpSession session,
											@RequestParam(value="id") String id) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int co_no =0;
		HashMap<String, String> map = new HashMap<>();
		map.put("id",loginUser.getId());
		map.put("friendId", id);
		String friendName = cService.selectfriendName(id);
		
		System.out.println("friendName : " +friendName);
		Chat ch1 = new Chat();
			ch1 = cService.selectChatOnetoOne(map);
			System.out.println("검색결과 " + ch1);
			//참고 에욱
		if( ch1 == null) {
			int result = cService.insertChatOnetoTOne(map);
			
			ch1 = cService.selectChatOnetoOne(map);//채팅번호 가져오기
			
				if(result >0) {
					co_no = ch1.getCo_no();
				}
				
		}else {
			co_no = ch1.getCo_no();// 번호

		}
		
		//채팅 리스트 가져오기
		ArrayList<Chat> chatlist = new ArrayList<Chat>();
		
		chatlist = cService.selectOneToOnechatlist(ch1.getCo_no());
		System.out.println("chatlist : " + chatlist);
//		mv.addObject("chlist", chatlist).addObject("friendName", friendName);
		/*
		 * System.out.println("받아온 아이디" +id); System.out.println("본인 아이디" +
		 * loginUser.getId());
		 */
		
		return "redirect:chatroomdetail.do?co_no="+co_no+"&friendid="+id;
		
	}
	
	@RequestMapping("chatroom.do")
	public ModelAndView chatroomView(ModelAndView mv,HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		
		ArrayList<Chat> ch = new ArrayList<Chat>();
				ch = cService.selectchatroom(loginUser.getId());
		ArrayList<Chat> ch2 = new ArrayList<Chat>();
				ch2 = cService.selectchatroom2(loginUser.getId());
		
		ArrayList<Chat> count = new ArrayList<Chat>();
				count = cService.selectcount();
		System.out.println("count : " + count);
		System.out.println("loginUser id : " + loginUser.getId());
		//if(ch.isEmpty() && count.isEmpty()) {
		for(int i=0; i<ch.size();i++) {
			Chat temporarychat = new Chat();
					temporarychat =	ch.get(i);
			
			for(int j=0; j<count.size();j++) {
				Chat temporarycount = new Chat();
				temporarycount = count.get(j);
				if(temporarychat.getCo_no() == temporarycount.getCo_no()) {
					if(!loginUser.getId().equals(temporarycount.getId()) ) {
					ch.get(i).setCount(temporarycount.getCount());
					}
				}
			}
		}
		//}
		
		//if(ch2.isEmpty() && count.isEmpty()) {
		for(int i=0; i<ch2.size();i++) {
			Chat temporarychat = new Chat();
			temporarychat =	ch2.get(i);
			
			for(int j=0; j<count.size();j++) {
				Chat temporarycount = new Chat();
				temporarycount = count.get(j);
				if(temporarychat.getCo_no() == temporarycount.getCo_no()) {
					if(!loginUser.getId().equals(temporarycount.getId())) {
					ch2.get(i).setCount(temporarycount.getCount());
					}
				}
			}
		}
		//}
		
		System.out.println("ch : " + ch);
		System.out.println("ch2 : " + ch2);
		mv.addObject("chroomlist2", ch2).addObject("chroomlist", ch).setViewName("chat/chatroomlist");
		return mv;
	}
	
	@RequestMapping("chatroomdetail.do")
	public ModelAndView chatroomdetail(ModelAndView mv,HttpSession session,
										@RequestParam(value="co_no") int co_no,
										@RequestParam(value="friendid")String friendid) {
		System.out.println("friendid : " + friendid);
		System.out.println("co_no :" + co_no);
		
		String friendName = cService.selectfriendName(friendid);
		
		
		//채팅 리스트 뿌려줘야함.
		//Chat ch = cService.selectchatroomdetail(co_no); //임시
		
		ArrayList<Chat> chatlist = new ArrayList<Chat>();
		
		chatlist = cService.selectOneToOnechatlist(co_no);
		System.out.println("chatlist : " + chatlist);
		//에욱
		session.setAttribute("co_no", co_no);
		mv.addObject("friendid", friendid).addObject("co_no", co_no).addObject("friendName", friendName).addObject("chlist",chatlist ).setViewName("chat/chatOneToOne");
		
		return mv;
	}
	@RequestMapping("openchatroom.do")
	public ModelAndView openchatroomView(ModelAndView mv, HttpSession session) {
		
		ArrayList<openChat> oclist = new ArrayList<openChat>();
		
		oclist= cService.selectopenchatroomlist();
		if(oclist != null) {
			System.out.println("oc : " + oclist);
		}else {
		System.out.println("조회된 방이 없습니다.");
		}
		
		
		mv.addObject("oclist", oclist).setViewName("chat/openchatlist");
		
		return mv;
	}
	
	@RequestMapping("insertopenchatroom.do")
	public ModelAndView insertopenchatroomView(ModelAndView mv, HttpSession session) {
		
		mv.setViewName("chat/insertchatroom");
		
		return mv;
	}
	
	@RequestMapping("openchatroominsert.do")
	public String openchatroominser(HttpSession session,openChat openchat) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		openchat.setCm_id(loginUser.getId());
		
		int result = cService.openchatroominsert(openchat);
		
		if(result > 0 ) {
			
			int cm_no = cService.selectopenchatroom(openchat);
			
			return "redirect:openchatview.do?cm_no=" + cm_no;
		}else {
			System.out.println("방만들기 실패");
			return "<script> alert('방만들기에 실패하였습니다..'); history.back(); </script>";
		}
		
	}
	@RequestMapping("openchatview.do")
	public ModelAndView openchatView(ModelAndView mv,HttpSession session, int cm_no) {
		
		System.out.println("잘넘어왔습니까?" + cm_no);
		
		
		Member loginUser = (Member) session.getAttribute("loginUser");
			//추가할것.. 방인원..
		openChat openchat = cService.selectopenchatroomdetail(cm_no);
		System.out.println("openchat : " + openchat);
		ArrayList<openChat> chatlist = cService.selectchatlist(cm_no);
		
		System.out.println("chatlist : " + chatlist);
		
		
		session.setAttribute("cm_no", cm_no);
		
		mv.addObject("chatlist", chatlist).addObject("cm_no", cm_no).addObject("openchat", openchat).setViewName("chat/openChatroom");
		
		
		return mv;
		
		
	}
	
	@RequestMapping("passwordcheck.do")
	public void passwordcheck(HttpServletResponse response,String result,String cm_no) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		System.out.println("입력받은  password:" + result);
		System.out.println("방번호 cm_no : " + cm_no);
		HashMap<String,Object> check = new HashMap<String, Object>();
		check.put("cm_no", cm_no);
		check.put("pwd", result);
		
		openChat opcheck = cService.passwordcheck(check);
		System.out.println("opcheck : " + opcheck);
		String str = "";
		if(opcheck == null) {
			str="비밀번호가 일치하지 않습니다.";
		}else if (opcheck != null){
			str="비밀번호가 일치합니다.";
		}
		
		
		
		  PrintWriter out = response.getWriter();
		 
		  out.print(str);
		  out.flush();
		  out.close();
		
		
	
	}
	@RequestMapping("deletefriend.do")
	public String deletefriend(HttpSession session,String id) {
		System.out.println("친구 아이디 : " + id);
		Member m = (Member)session.getAttribute("loginUser");
		
		String str =  m.getId();
		System.out.println("사용자 아이디 : " + str);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		map.put("friendid", id);
		map.put("id",str);
		
		int result = cService.deletefriend(map);
		
		if(result > 0) {
			return "redirect:chatview.do";
		}else {
			return "<script> alert('방만들기에 실패하였습니다..'); history.back(); </script>";
		}
		
	}
	
	@RequestMapping("recommendList.do")
	public void recommendList(HttpSession session,HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		
		Member m =(Member)session.getAttribute("loginUser");
		
		String id = m.getId();
		System.out.println("아이디 : " + id);
		//어레이리스트로 작업하기
		ArrayList<Member> recommendinformation = new ArrayList<Member>();
		
		recommendinformation = cService.recommendList(id);
		
		System.out.println("recommendinformation : " + recommendinformation);
		
		JSONArray jarr = new JSONArray();
		
		for(Member fi : recommendinformation) {
			JSONObject jMember = new JSONObject();
			
			jMember.put("name", fi.getName());
			jMember.put("Rename_file", fi.getRename_file());
			jMember.put("nickname", fi.getNickname());
			jMember.put("id", fi.getId());
			
			jarr.add(jMember);
		}
		
		JSONObject sendJson = new JSONObject();
		
		sendJson.put("list",jarr);
		
		PrintWriter out = response.getWriter();
		
		out.print(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping("report.do")
	public void report(HttpSession session,HttpServletResponse response,
						String chatid,String content, String option) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("chatid : " + chatid + ",content : " +content + ",option : " +option);
		
		Member m =(Member)session.getAttribute("loginUser");
		
		String id = m.getId();
		System.out.println("아이디 : " + id);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("chatid", chatid);
		map.put("content", content);
		map.put("option", option);
		map.put("id", id);
		
		//신고 인서트
		int result = cService.insertreport(map);
		String str="";
		if(result > 0) {
			str="신고가 접수되었습니다";
		}else {
			str="신고가 접수에 실패하였습니다. 다시시도해주세요";
		}

		  PrintWriter out = response.getWriter();
		 
		  out.print(str);
		  out.flush();
		  out.close();
		
	}
	@RequestMapping("openchatroomdelete.do")
	public String openchatroomdelete(HttpSession session, String cm_no) {
		System.out.println("ㄴㅁㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇcm_no : " + cm_no);
		//방에서의 채팅기록 삭제
		int result = cService.deleteopenchatlist(cm_no);
		//방삭제
		int result2 = cService.deleteopenchatroom(cm_no);
		 System.out.println("여기까지오나?");
		return "redirect:openchatroom.do";
	}
	
	@RequestMapping("openchatroomout.do")
	public String openchatroomot(HttpSession session,String cm_no ) {
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("cm_no", cm_no);
		
		int result = cService.openchatroomOut(map2);
		
		return "redirect:openchatroom.do";
	}
	
	@RequestMapping("managerchat.do")
	public ModelAndView managerchat(HttpSession session,ModelAndView mv) {
		int co_no = 0;
		Member m = (Member)session.getAttribute("loginUser");
		String user = m.getId();
		
		Chat ch= cService.selectmanagerchat(user);
		
		if(ch == null) {
			int result = cService.insertmanagerchat(user);
			ch= cService.selectmanagerchat(user);
			co_no = ch.getCo_no();
		}else {
			co_no = ch.getCo_no();
		}
		
		//대화가있으면 가져오자
		ArrayList<Chat> chatlist = new ArrayList<Chat>();
		
		chatlist = cService.selectOneToOnechatlist(co_no);
		System.out.println("chatlist : " + chatlist);
		
		session.setAttribute("co_no", co_no);
		
		String admin ="admin";
		String adminName = "관리자";
		mv.addObject("friendid", admin).addObject("co_no", co_no).addObject("friendName", adminName).addObject("chlist",chatlist ).setViewName("chat/chatOneToOne");
		
		return mv;
		
	}
	@RequestMapping("filesaves.do")
	public void filesaves(HttpSession session,HttpServletRequest request,HttpServletResponse response,
											MultipartFile file ) throws IOException {
		System.out.println("data : " + file.getOriginalFilename());
		
		response.setContentType("text/html;charset=utf-8");
		 String str ="";
		 String renameFileName ="";
		 if(!file.getOriginalFilename().equals("")) {
			 renameFileName = saveFile(file,request);
			 
			 System.out.println("오리진 파일 : " + renameFileName);
			 
			 str="파일 저장 성공";

		 }else {
			 str ="저장실패";
		 }
		  PrintWriter out = response.getWriter();
			 
		  out.print(renameFileName);
		  out.flush();
		  out.close();
		 

	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\cuploadFiles"; //경로확인
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();			
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName= file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." 	
				+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		return renameFileName;	
	}
}
