package com.daowen.controller;

import com.daowen.entity.Zhiyuan;
import com.daowen.service.ZhiwuService;
import com.daowen.service.ZhiyuanService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;

/**************************
 * 
 * 员工控制
 *
 */
@Controller
public class ZhiyuanController extends SimpleController {
	@Autowired
	// 业务服务
	private ZhiyuanService zhiyuanSrv = null;

	@Autowired
	private ZhiwuService zhiwuSrv = null;

	@Override
	@RequestMapping("/admin/zhiyuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String repassword2 = request.getParameter("repassword2");
		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Zhiyuan zhiyuan = zhiyuanSrv.load(new Integer(id));
		if (zhiyuan != null) {
			if (!zhiyuan.getPassword().equals(password1)) {
				request.setAttribute("errormsg",
						"<label class='error'>原始密码不正确，不能修改</label>");
				forward(errorpageurl);

			} else {
				zhiyuan.setPassword(repassword1);
				zhiyuanSrv.update(zhiyuan);
				request.getSession().setAttribute("zhiyuan", zhiyuan);
				redirect(forwardurl);
			}
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		zhiyuanSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String lianxiren = request.getParameter("lianxiren");
		String jiguan = request.getParameter("jiguan");
		String nation = request.getParameter("nation");
		String bumen = request.getParameter("bumen");
		String zhiwu = request.getParameter("zhiwu");
		String mobile = request.getParameter("mobile");
		String qq = request.getParameter("qq");
		String des = request.getParameter("des");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfzhiyuan = new SimpleDateFormat("yyyy-MM-dd");
		Zhiyuan zhiyuan = new Zhiyuan();
		zhiyuan.setAccountname(accountname == null ? "" : accountname);
		zhiyuan.setPassword("123456");
		zhiyuan.setName(name == null ? "" : name);
		zhiyuan.setSex(sex == null ? "" : sex);
		zhiyuan.setLianxiren(lianxiren == null ? "" : lianxiren);
		zhiyuan.setJiguan(jiguan == null ? "" : jiguan);
		zhiyuan.setNation(nation == null ? "" : nation);
		zhiyuan.setBumen(bumen == null ? "" : bumen);
		zhiyuan.setZhiwu(zhiwu == null ? "" : zhiwu);
		zhiyuan.setMobile(mobile == null ? "" : mobile);
		zhiyuan.setQq(qq == null ? "" : qq);
		zhiyuan.setDes(des == null ? "" : des);
		zhiyuan.setPhoto(photo == null ? "" : photo);
		// 产生验证
		Boolean validateresult = zhiyuanSrv.isExist("where accountname='"
				+ accountname + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>已经存在的工号</label>");
				request.setAttribute("zhiyuan", zhiyuan);

				List<Object> zhiwu_datasource = zhiwuSrv.getEntity("");
				request.setAttribute("zhiwu_datasource", zhiwu_datasource);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		zhiyuanSrv.save(zhiyuan);
		// 保存附件

		if (forwardurl == null) {
			forwardurl = "/admin/zhiyuanmanager.do?actiontype=get";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Zhiyuan zhiyuan = zhiyuanSrv.load(new Integer(id));
		if (zhiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String lianxiren = request.getParameter("lianxiren");
		String jiguan = request.getParameter("jiguan");
		String nation = request.getParameter("nation");
		String bumen = request.getParameter("bumen");
		String zhiwu = request.getParameter("zhiwu");
		String mobile = request.getParameter("mobile");
		String qq = request.getParameter("qq");
		String des = request.getParameter("des");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfzhiyuan = new SimpleDateFormat("yyyy-MM-dd");
		if (accountname != null)
			zhiyuan.setAccountname(accountname);

		zhiyuan.setName(name);
		zhiyuan.setSex(sex);
		zhiyuan.setLianxiren(lianxiren);
		zhiyuan.setJiguan(jiguan);
		zhiyuan.setNation(nation);
		if (bumen != null)
			zhiyuan.setBumen(bumen);
		if (zhiwu != null)
			zhiyuan.setZhiwu(zhiwu);
		zhiyuan.setMobile(mobile);
		zhiyuan.setQq(qq);
		zhiyuan.setDes(des);
		zhiyuan.setPhoto(photo);
		zhiyuanSrv.update(zhiyuan);

		if (forwardurl == null) {
			forwardurl = "/admin/zhiyuanmanager.do?actiontype=get";
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
			Zhiyuan zhiyuan = zhiyuanSrv.load("where id=" + id);
			if (zhiyuan != null) {
				request.setAttribute("zhiyuan", zhiyuan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);

		List<Object> zhiwu_datasource = zhiwuSrv.getEntity("");
		request.setAttribute("zhiwu_datasource", zhiwu_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/zhiyuanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String accountname = request.getParameter("accountname");
		if (accountname != null)
			filter += "  and accountname like '%" + accountname + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 14;
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
		List<Zhiyuan> listzhiyuan = zhiyuanSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = zhiyuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listzhiyuan", listzhiyuan);
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
			forwardurl = "/admin/zhiyuanmanager.jsp";
		}
		forward(forwardurl);
	}

}
