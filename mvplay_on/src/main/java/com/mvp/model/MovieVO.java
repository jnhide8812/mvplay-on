package com.mvp.model;

import java.util.Date;

public class MovieVO {

	//영화 제목(movieTitle)
	private String movieTitle;
	
	//영화 고유 ID(movieId)
	private int movieId;
	
	//영화 포스터(poster)
	private String poster;
	
	//영화 내용(movieContent)
	private String movieContent;
	
	//영화 장르 카테고리1(cate1)
	private String cate1;
	
	//영화 장르 카테고리2(cate2)
	private String cate2;
	
	//영화 열람 권한 체크(movieCheck)
	private String movieCheck;
	
	//영화 구매 가격(buyPrice)
	private int buyPrice;
	
	//영화 대여 가격(rentalPrice)
	private int rentalPrice;
	
	//영화 누적 결제 수(순위선정용)(movieTotalpay)
	private int movieTotalpay;
	
	//영화 개봉일(movieDate)
	private Date movieDate;

	//Getter-Setters
	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getMovieContent() {
		return movieContent;
	}

	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}

	public String getCate1() {
		return cate1;
	}

	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}

	public String getCate2() {
		return cate2;
	}

	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}

	public String getMovieCheck() {
		return movieCheck;
	}

	public void setMovieCheck(String movieCheck) {
		this.movieCheck = movieCheck;
	}

	public int getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}

	public int getRentalPrice() {
		return rentalPrice;
	}

	public void setRentalPrice(int rentalPrice) {
		this.rentalPrice = rentalPrice;
	}

	public int getMovieTotalpay() {
		return movieTotalpay;
	}

	public void setMovieTotalpay(int movieTotalpay) {
		this.movieTotalpay = movieTotalpay;
	}

	public Date getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}

	//toString
	@Override
	public String toString() {
		return "MovieVO [movieTitle=" + movieTitle + ", movieId=" + movieId + ", poster=" + poster + ", movieContent="
				+ movieContent + ", cate1=" + cate1 + ", cate2=" + cate2 + ", movieCheck=" + movieCheck + ", buyPrice="
				+ buyPrice + ", rentalPrice=" + rentalPrice + ", movieTotalpay=" + movieTotalpay + ", movieDate="
				+ movieDate + "]";
	}
	
	
}
