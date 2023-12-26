package com.daowen.service;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import com.daowen.entity.Xinxi;
import com.daowen.jdbc.simplecrud.DataRow;
import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.mapper.XinxiMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
import com.daowen.util.BeansUtil;
@Service
public class XinxiService extends SimpleBizservice<XinxiMapper>{

   
   public  List<Xinxi> findXinxi(int lanmuId){
		
		String sql=MessageFormat.format("select * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc",lanmuId);
		if(lanmuId<=0)
			sql="selec * from xinxi";
		List<Xinxi> list=query(sql);
		return list;
	}
	
	public  List<Xinxi> findXinxi(int lanmuId ,int pageIndex,int pageSize){
		String sql=MessageFormat.format(" select * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc limit {1},{2}  ",lanmuId,(pageIndex-1)*pageSize,pageSize);
		if(lanmuId<=0)
			sql=" selec * from xinxi";
		List<Xinxi> list=this.query(sql);
		return list;
	}
	
	public  int getCount(int lanmuid ){
		
		SimpleJdbc jdbc=BeansUtil.getSimpleJdbcBean();
		String sql=MessageFormat.format(" select count(*) from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} ",lanmuid);
		DataTable dt=null;
		try {
			dt=jdbc.query(sql,null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(dt!=null)
		{
			List<DataRow> dr=dt.getRows();
			if(dr.size()>0){
				return dr.get(0).getNumber(0).intValue();
			}
		}
		return 0;
		
		
		
	}
	
	
    public  List<Xinxi> getTopXinxi(int lanmuId,int topCount){
		String sql=MessageFormat.format("select  * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc  limit {1} ",lanmuId,topCount);
    	
    	List<Xinxi> list=query(sql);
		return list;
	}
    
   
	
}
