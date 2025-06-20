package com.marondal.welibrary.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondal.welibrary.book.model.WishBookDetail;
import com.marondal.welibrary.book.wishbook.bo.WishBookBO;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private final WishBookBO wishBookBO;
	
	// 희망도서/ 도서 추가 겸 희망도서 조회창
	@GetMapping("/wishbook/list/view")
	public String wishbookInput(
								Model model
								, HttpSession session
			) {
		int userId = (Integer)session.getAttribute("userId");
		
		List<WishBookDetail> wishbookDetailList = wishBookBO.getWishBookListById(userId);
		model.addAttribute("wishbookDetailList", wishbookDetailList);		

		// 여기서 희망도서개수 추가
		Integer wishBookCount = wishbookDetailList.size();
		model.addAttribute("wishBook", wishBookCount);

		return "/admin/wishbooklist";
	}

	// 공지사항 등록/수정, 행사 등록/수정

}
