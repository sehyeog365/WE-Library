package com.marondal.welibrary.book.wishbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.welibrary.book.model.WishBook;


@Repository
public interface WishBookDAO {

		// 희망도서 신청
		public int insertWishBook(@Param("userId") int userId
								  , @Param("library") String libray
								  , @Param("title") String title
								  , @Param("imagePath") String imagePath
								  , @Param("author") String author
								  , @Param("publisher") String publisher
								  , @Param("price") int price
								  , @Param("isbn") String isbn
								  , @Param("pubyear") int pubyear
								  );

		// 희망도서 리스트
		public List<WishBook> selectWishBookList(@Param("userId") int userId);

		// 유저별 희망도서 갯수세기 return type int 타입이 맞다.
		public int selectWishBookCount(@Param("userId") int userId);
		
		// 희망도서 갯수 표시(유저별)
		public List<WishBook> selectWishBookNumberByUserId(@Param("userId") int userId);
		
		// 희망도서 신청 여부 
		public int selectBookByLibraryTitle(@Param("library") String library, @Param("title")String title);
	
		// 관리자
		
		// 전체 희망도서 권수세기
		public int selectAllWishBookCount(@Param("id")int id);

		// 전체 희망도서 권수 표시
		public List<WishBook> selectAllWishBookNumberById(@Param("id")int id);
		
		// 관리자 희망도서 신청 리스트 조회
		public List<WishBook> selectWishBookListById(@Param("id") int id);
		
		// 희망도서 북테이블에 추가 
		public int insertWishbookIntoBook(
										  @Param("library") String libray
										  , @Param("title") String title
										  , @Param("imagePath") String imagePath
										  , @Param("author") String author
										  , @Param("publisher") String publisher
										  , @Param("price") int price
										  , @Param("isbn") String isbn
										  , @Param("pubyear") int pubyear
										  , @Param("appendix") String appendix
										);
		
}
