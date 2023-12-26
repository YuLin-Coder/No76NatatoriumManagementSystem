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
 * 活动控制
 *
 */
@Controller
public class HuodongController extends SimpleController {
	@Autowired
	private HuodongService huodongSrv = null;

	@Override
	@RequestMapping("/admin/huodongmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public void changestate() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String status = request.getParameter("state");
		int statuscode = 1;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Huodong huodong = huodongSrv.load(" where id=" + id);
		if (huodong == null)
			return;
		if (status != null)
			statuscode = Integer.parseInt(status);
		huodong.setState(statuscode);
		huodongSrv.update(huodong);
		if (forwardurl == null) {
			forwardurl = "/admin/huodongmanager.do?actiontype=get";
		}
		redirect(forwardurl);
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
		huodongSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String totalfee = request.getParameter("totalfee");
		String youhui = request.getParameter("youhui");
		String state = request.getParameter("state");
		SimpleDateFormat sdfhuodong = new SimpleDateFormat("yyyy-MM-dd");
		Huodong huodong = new Huodong();
		huodong.setTitle(title == null ? "" : title);
		huodong.setTotalfee(totalfee == null ? 0 : new Integer(totalfee));
		huodong.setYouhui(youhui == null ? 0 : new Integer(youhui));
		huodong.setState(1);
		huodongSrv.save(huodong);
		if (forwardurl == null) {
			forwardurl = "/admin/huodongmanager.do?actiontype=get";
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
		Huodong huodong = huodongSrv.load(new Integer(id));
		if (huodong == null)
			return;
		String title = request.getParameter("title");
		String totalfee = request.getParameter("totalfee");
		String youhui = request.getParameter("youhui");
		String state = request.getParameter("state");
		SimpleDateFormat sdfhuodong = new SimpleDateFormat("yyyy-MM-dd");
		huodong.setTitle(title);
		huodong.setTotalfee(totalfee == null ? 0 : new Integer(totalfee));
		huodong.setYouhui(youhui == null ? 0 : new Integer(youhui));
		huodongSrv.update(huodong);
		if (forwardurl == null) {
			forwardurl = "/admin/huodongmanager.do?actiontype=get";
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
			Huodong huodong = huodongSrv.load("where id=" + id);
			if (huodong != null) {
				request.setAttribute("huodong", huodong);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/huodongadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
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
		List<Huodong> listhuodong = huodongSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = huodongSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listhuodong", listhuodong);
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
			forwardurl = "/admin/huodongmanager.jsp";
		}
		forward(forwardurl);
	}
}
