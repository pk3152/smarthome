package com.cos.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cos.domain.UserVO;
import com.cos.service.UserService;

@Controller
public class HomeController {
	
	@Inject
	private UserService userService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, UserVO user,HttpSession session) throws Exception{
		System.out.println(user.getUserEmail());
		userService.insert(user);
		session.setAttribute("userID", user.getUserID());
		model.addAttribute("msg", "회원가입이 되었습니다.");
	    model.addAttribute("url", "/");
	    return "popup/alert";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,UserVO user, HttpSession session)  throws Exception {
		if(session.getAttribute("userID") != null) {
			  model.addAttribute("msg", "이미 로그인되어있습니다.");
			  model.addAttribute("url", "/");
			  return "popup/alert";
		}else {
			
			UserVO vo = userService.check(user);
			
			if(vo == null) {
			    model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			    model.addAttribute("url", "/");
			    return "popup/alert";
			}else {
				session.setAttribute("userID", user.getUserID());
				model.addAttribute("msg", "로그인 되었습니다.");
			    model.addAttribute("url", "/");
			    return "popup/alert";
			}
			
		}

	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session)  throws Exception{				
	    session.invalidate(); // 세션삭제
	    model.addAttribute("msg", "로그아웃 되었습니다.");
	    model.addAttribute("url", "/");
	    return "popup/alert";
	}
}
