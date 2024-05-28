package com.mvp.model;

import java.util.List;

public class ReplyPageVO {

	List<ReplyVO> list;

	PageVO pageInfo;
	
	public List<ReplyVO> getList() {
		return list;
	}

	public void setList(List<ReplyVO> list) {
		this.list = list;
	}

	public PageVO getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageVO pageInfo) {
		this.pageInfo = pageInfo;
	}

	@Override
	public String toString() {
		return "ReplyPageVO [list=" + list + ", pageInfo=" + pageInfo + "]";
	}
	
}
