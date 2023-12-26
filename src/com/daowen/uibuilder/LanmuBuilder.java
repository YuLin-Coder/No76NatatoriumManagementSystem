package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daowen.entity.Lanmu;
import com.daowen.entity.Xinxi;
import com.daowen.service.LanmuService;
import com.daowen.service.XinxiService;
import com.daowen.util.BeansUtil;



public class LanmuBuilder extends UibuilderBase<Xinxi> {
	
	//栏目服务
	private LanmuService lanmuSrv=null;
	private XinxiService xinxiSrv=null;
	public LanmuBuilder(HttpServletRequest request){
		
		super("box", "title", "tupian2",request.getContextPath());
		lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
		xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
	}
	
	/***
	 * 
	 * @param lanmuid 栏目编号
	 * 
	 * @return  返回栏目信息
	 */
	public String buildTextLanmu(int lanmuid,int count){
		
		StringBuffer sb=new StringBuffer();
		Lanmu lm=lanmuSrv.load("where id="+lanmuid);
		if(lm==null)
			return "";
		List<Xinxi> listxinxi=null;
		if(count<0)
		    listxinxi=findXinxiByLanmu(lanmuid);
		else
			listxinxi=findXinxiByLanmu(lanmuid,count);
	    sb.append(buildTextLanmu(listxinxi, lm.getTitle()));
		return sb.toString();
		
	}
	public String buildTextLanmu(int lanmuid) {
		return buildTextLanmu(lanmuid,-1);
	}
	/***
	 * 
	 * @param lanmuid 栏目编号
	 * 
	 * @return  返回栏目信息
	 */
	public String buildImageLanmu(int lanmuid){
		
		StringBuffer sb=new StringBuffer();
		Lanmu lm=(Lanmu)lanmuSrv.load("where id="+lanmuid);
		if(lm==null)
			return "";
		List<Xinxi> listxinxi=findXinxiByLanmu(lanmuid);
		//
		System.out.println("栏目信息数量为="+listxinxi.size());
	    sb.append(buildImageLanmu(listxinxi, lm.getTitle()));
		return sb.toString();
		
	}

	/**
	 * 
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildRecomment(String lanmudes){
		
		StringBuffer sb=new StringBuffer();
		List<Xinxi> listxinxi=xinxiSrv.getTopEntity("where tuijian=1 order by pubtime desc",10);
	    sb.append(buildTextLanmu(listxinxi, lanmudes));
		return sb.toString();
	
		
	}
	
	/**
	 * 
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildNewest(String lanmudes){
		StringBuffer sb=new StringBuffer();
		List<Xinxi> listxinxi=xinxiSrv.getTopEntity("where zuixin=1 order by pubtime desc",10);
	    sb.append(buildTextLanmu(listxinxi, lanmudes));
        return sb.toString();
	}
	
	public  List<Xinxi> findXinxiByLanmu(int lanmuid){
		List<Xinxi> list=xinxiSrv.query(MessageFormat.format("select * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc",lanmuid));
		return list;
	}
	
    public  List<Xinxi> findXinxiByLanmu(int lanmuid,int topcount){
		List<Xinxi> list=xinxiSrv.query(MessageFormat.format("select  * from  xinxi where lanmuid in (select id from lanmu where parentid={0}) or lanmuid={0} order by pubtime desc  limit {1} ",lanmuid,topcount));
		return list;
	}
    
    /**
	 * 
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildTuijianTextContent(String classname){
		
		StringBuffer sb=new StringBuffer();
		
		
		List<Xinxi> listxinxi=xinxiSrv.getTopEntity("where tuijian=1 order by pubtime desc",10);
		
		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");
		
		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {
		  
			Xinxi xinxi = it.next();
			
			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));
			
		
		}
		sb.append("\r\n");
		sb.append("</ul>");
		
		return sb.toString();
	}
	
	
	
	/**
	 * 
	 * @param classname
	 * @return获取推荐资讯信息文本内容
	 */
	public String buildZuixinTextContent(String classname){
		
		StringBuffer sb=new StringBuffer();
		
		
		List<Xinxi> listxinxi=xinxiSrv.getTopEntity("where zuixin=1 order by pubtime desc",10);
		
		sb.append(MessageFormat.format("<ul class=\"{0}\">", classname));
		sb.append("\r\n");
		
		for (Iterator<Xinxi> it = listxinxi.iterator(); it.hasNext();) {
		  
			Xinxi xinxi = it.next();
			
			sb.append(MessageFormat.format("<li><a title=\"{1}\" href=\"xinxiinfo.jsp?id={0}\">{1}</a></li>", xinxi.getId(),xinxi.getTitle()));
			
		
		}
		sb.append("\r\n");
		sb.append("</ul>");
		
		return sb.toString();
	}
	
	
	
    
    
	
	
	
}
