package com.daowen.dto;

//
public interface IShopcartAdapter {

	/**
	 * 包装成购物车项
	 * @param key
	 * @return
	 */
	public ShopcartItem  pack(int key, int count);
	
}
