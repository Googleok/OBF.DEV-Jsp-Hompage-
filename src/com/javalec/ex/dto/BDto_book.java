package com.javalec.ex.dto;

import java.sql.Timestamp;

//Model역활을 할 class
public class BDto_book {
	String bId;
	String bName;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;
	int bGroup;
	int bStep;
	int bIndent;
	private String title; // 제목
	private String description; // 설명
	private String pubDate; // 출판일
	private String priceStandard; // 정가
	private String priceSales; // 할인가
	private String discountRate; // 할인율
	private String saleStatus; // 판매상태
	private String customerReviewRank; // 별점
	private String author; // 작가
	private String image;
	private String link;
	private String language;
	
	
	public BDto_book() {

	}
	
	
	public BDto_book(String bId, String bName, String bTitle, String bContent, Timestamp bDate, int bHit, int bGroup,
			int bStep, int bIndent) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
	}

	public BDto_book(String bId, String bName, String bTitle, String bContent, Timestamp bDate, int bHit, int bGroup,
			int bStep, int bIndent, String description, String image, String language) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.description = description;
		this.image = image;
		this.language = language;
	}


	public BDto_book(String bId, String bName, String bTitle, String bContent, Timestamp bDate, int bHit, int bGroup,
			int bStep, int bIndent, String title, String description, String pubDate, String priceStandard,
			String priceSales, String discountRate, String saleStatus, String customerReviewRank, String author,
			String image, String link, String language) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.title = title;
		this.description = description;
		this.pubDate = pubDate;
		this.priceStandard = priceStandard;
		this.priceSales = priceSales;
		this.discountRate = discountRate;
		this.saleStatus = saleStatus;
		this.customerReviewRank = customerReviewRank;
		this.author = author;
		this.image = image;
		this.link = link;
		this.language = language;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getbId() {
		return bId;
	}
	
	public void setbId(String bId) {
		this.bId = bId;
	}



	public String getbName() {
		return bName;
	}



	public void setbName(String bName) {
		this.bName = bName;
	}



	public String getbTitle() {
		return bTitle;
	}



	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}



	public String getbContent() {
		return bContent;
	}



	public void setbContent(String bContent) {
		this.bContent = bContent;
	}



	public Timestamp getbDate() {
		return bDate;
	}



	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}



	public int getbHit() {
		return bHit;
	}



	public void setbHit(int bHit) {
		this.bHit = bHit;
	}



	public int getbGroup() {
		return bGroup;
	}



	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}



	public int getbStep() {
		return bStep;
	}



	public void setbStep(int bStep) {
		this.bStep = bStep;
	}



	public int getbIndent() {
		return bIndent;
	}



	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}



	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getPriceStandard() {
		return priceStandard;
	}

	public void setPriceStandard(String priceStandard) {
		this.priceStandard = priceStandard;
	}

	public String getPriceSales() {
		return priceSales;
	}

	public void setPriceSales(String priceSales) {
		this.priceSales = priceSales;
	}

	public String getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}

	public String getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}

	public String getCustomerReviewRank() {
		return customerReviewRank;
	}

	public void setCustomerReviewRank(String customerReviewRank) {
		this.customerReviewRank = customerReviewRank;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
