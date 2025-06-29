package com.marondal.welibrary.book.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class InterestBook {
	private int id;
	private int userId;
	private int bookId;
	private Date createdAt;
	private Date updatedAt;
}
