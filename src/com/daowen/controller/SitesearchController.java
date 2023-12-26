package com.daowen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Xinxi;
import com.daowen.service.XinxiService;
import com.daowen.ssm.simplecrud.SimpleController;

@Controller
public class SitesearchController extends SimpleController {

	@Override
	@RequestMapping("/admin/sitesearch.do")
	public void mapping(HttpServletRequest req, HttpServletResponse resp) {
		mappingMethod(req,resp);

	}
	
	private void find() {

		String searchtype = request.getParameter("searchtype");
        String  title=request.getParameter("title");
        System.out.println("searchtype="+searchtype);
		
		if(searchtype!=null&&searchtype.equals("2")){
	            List<Xinxi> xinxilist=null;
	            if(title!=null){
	            	 xinxilist=xinxiSrv.getEntity("where title like '%"+title+"%'");
	                 request.setAttribute("xinxilist", xinxilist);
	            }
			
			forward("/e/searchnews.jsp");
		}
	}
	
	

	@Autowired
	private XinxiService xinxiSrv=null;
	
}
