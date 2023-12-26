package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 宠物服务控制
 *
 */
@Controller
public class PetsrvController extends SimpleController {
	@Autowired
	private PetsrvService petsrvSrv = null;

	@Override
	@RequestMapping("/admin/petsrvmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		petsrvSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String srvname = request.getParameter("srvname");
		String srvtype = request.getParameter("srvtype");
		String price = request.getParameter("price");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String des = request.getParameter("des");
		String tupian = request.getParameter("tupian");
		String pubren=request.getParameter("pubren");
		SimpleDateFormat sdfpetsrv = new SimpleDateFormat("HH:mm");
		Petsrv petsrv = new Petsrv();
		petsrv.setSrvname(srvname == null ? "" : srvname);
		petsrv.setSrvtype(srvtype == null ? 0 : new Integer(srvtype));
		petsrv.setPrice(price == null ? 0 : new Integer(price));
		if (begintime != null) {
			try {
				petsrv.setBegintime(sdfpetsrv.parse(begintime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			petsrv.setBegintime(new Date());
		}
		if (endtime != null) {
			try {
				petsrv.setEndtime(sdfpetsrv.parse(endtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			petsrv.setEndtime(new Date());
		}
		petsrv.setPubren(pubren==null?"":pubren);
		petsrv.setDes(des == null ? "" : des);
		
		petsrv.setTupian(tupian == null ? "" : tupian);
		petsrvSrv.save(petsrv);
		if (forwardurl == null) {
			forwardurl = "/admin/petsrvmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Petsrv petsrv = petsrvSrv.load(new Integer(id));
		if (petsrv == null)
			return;
		String srvname = request.getParameter("srvname");
		String srvtype = request.getParameter("srvtype");
		String price = request.getParameter("price");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String pubren=request.getParameter("pubren");
		String des = request.getParameter("des");
		String tupian = request.getParameter("tupian");
		SimpleDateFormat sdfpetsrv = new SimpleDateFormat("HH:mm");
		petsrv.setSrvname(srvname);
		petsrv.setPubren(pubren==null?"":pubren);
		petsrv.setSrvtype(srvtype == null ? 0 : new Integer(srvtype));
		petsrv.setPrice(price == null ? 0 : new Integer(price));
		if (begintime != null) {
			try {
				petsrv.setBegintime(sdfpetsrv.parse(begintime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (endtime != null) {
			try {
				petsrv.setEndtime(sdfpetsrv.parse(endtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		petsrv.setDes(des);
		petsrv.setTupian(tupian);
		petsrvSrv.update(petsrv);
		if (forwardurl == null) {
			forwardurl = "/admin/petsrvmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Petsrv petsrv = petsrvSrv.load("where id=" + id);
			if (petsrv != null) {
				request.setAttribute("petsrv", petsrv);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/petsrvadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String pubren=request.getParameter("pubren");
		String srvname = request.getParameter("srvname");
		if (srvname != null)
			filter += "  and srvname like '%" + srvname + "%'  ";
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Petsrv> listpetsrv = petsrvSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = petsrvSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listpetsrv", listpetsrv);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/petsrvmanager.jsp";
		}
		forward(forwardurl);
	}
}
