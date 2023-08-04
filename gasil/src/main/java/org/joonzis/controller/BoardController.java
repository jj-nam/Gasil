package org.joonzis.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.service.BoardService;
import org.joonzis.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		// 1. 서비스에서 getList() 호출
		// 2. 받아 온 list 데이터를 화면에 전달
		log.info("list...");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
		return "board/list";
	}
	
	@GetMapping("/register")
	public String register(Criteria cri, Model model) {
		model.addAttribute("cri", cri);
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("register..." + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", "ok");
		return "redirect:/board/list";	// jsp가 아닌 url을 태울려면 redirect 사용
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("bno") long bno, Model model, Criteria cri, 
			HttpServletRequest req,
			HttpServletResponse res) {
		log.info("/get..." + bno);
		viewCountUp(bno, req, res);
	    model.addAttribute("vo", service.get(bno));
	    model.addAttribute("cri", cri);
		return "board/get";
	}
	
	private void viewCountUp(long bno, HttpServletRequest req, HttpServletResponse res) {
		// 클라이언트로 요청이 등어온다.
		// 요청에 Cookie가 없고 글을 조회한다면 [게시글 no]의 값을 추가하여 Cookie 생성 (기간은 하루로 설정)
		// 요청에 Cookie가 있고 글을 조회한 기록이 있다면 pass 없다면 Cookie에 [게시글 no] 붙이기
		Cookie oldCookie = null;
			Cookie[] cookies = req.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("boardView")) {
		                oldCookie = cookie;
		            }
		        }
		    }
	
		    if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("[" + String.valueOf(bno) + "]")) {
		        	mapper.upView(bno);
		        	oldCookie.setValue(oldCookie.getValue() + "_[" + bno + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 24);
		            res.addCookie(oldCookie);
		        }
		    } else {
		    	mapper.upView(bno);
		        Cookie newCookie = new Cookie("boardView","[" + bno + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        res.addCookie(newCookie);
		    }
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("bno") long bno, Model model, Criteria cri) {
		log.info("modify");
		model.addAttribute("cri", cri);
		model.addAttribute("vo", service.get(bno));
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		log.info("modify : " + vo);
		
		if(service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		log.info(vo.getBno());
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") long bno, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		replyService.removeAll(bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}
	
	// 에디터
	@ResponseBody
	@RequestMapping(value = "fileupload.do", method=RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/noticeimg"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/noticeimg/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
}
