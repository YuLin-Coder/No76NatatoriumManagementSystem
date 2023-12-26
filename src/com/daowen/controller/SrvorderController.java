package com.daowen.controller;

import com.daowen.entity.Huiyuan;
import com.daowen.entity.Srvorder;
import com.daowen.service.HuiyuanService;
import com.daowen.service.SrvorderService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.util.SequenceUtil;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**************************
 * 
 * 预订服务控制
 *
 */
@Controller
public class SrvorderController extends SimpleController {
	@Autowired
	private SrvorderService srvorderSrv = null;

	@Autowired
	private HuiyuanService huiyuanSrv=null;
	@Override
	@RequestMapping("/admin/srvordermanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}
	
	private void payment() {

		String ddid = request.getParameter("id");

		String errorurl = request.getParameter("errorurl");

		String paypwd = request.getParameter("paypwd");
		if ((paypwd != null && !paypwd.equals(paypwd)) || paypwd == null) {
			request.setAttribute("errormsg",
					"<label class='error'>支付密码不正确请重新输入</label>");
			forward(errorurl);
			return;
		}
		if (ddid != null) {
			Srvorder dingdan =srvorderSrv.load("where id="
					+ ddid);

			if (dingdan != null && dingdan.getYdren() != null) {
				Huiyuan hy =huiyuanSrv.load("where accountname='" + dingdan.getYdren() + "'");

				if (hy.getYue() < dingdan.getPayfee()) {

					request.setAttribute("errormsg",
							"<label class='error'>账户余额不足于支付订单,请充值</label>");
					forward(errorurl);
					return;

				} else {

					hy.setYue((float) (hy.getYue() - dingdan.getPayfee()));

					huiyuanSrv.update(hy);

					dingdan.setState(2);
					srvorderSrv.update(dingdan);
					request.getSession().setAttribute("huiyuan", hy);
				}

			}

		}
		String forwardurl = request.getParameter("forwardurl");
		redirect(forwardurl);

	}

	private void srvover() {

		String ddid = request.getParameter("id");

		String errorurl = request.getParameter("errorurl");
		String srvdes = request.getParameter("srvdes");
		if (ddid != null) {
			Srvorder dingdan = srvorderSrv.load( "where id="
					+ ddid);
			if (srvdes != null)
				dingdan.setSrvdes(srvdes);
			dingdan.setState(3);
			srvorderSrv.update(dingdan);

		}

		String forwardurl = request.getParameter("forwardurl");
		redirect(forwardurl);

	}

	private void comment() {

		String ddid = request.getParameter("id");

		String errorurl = request.getParameter("errorurl");
		String commentdes = request.getParameter("commentdes");
		String comres = request.getParameter("comres");

		if (ddid != null) {
			Srvorder dingdan = srvorderSrv.load("where id="
					+ ddid);
			if (commentdes != null)
				dingdan.setCommentdes(commentdes);
			if (comres != null)
				dingdan.setComres(comres);

			dingdan.setState(4);
			srvorderSrv.update(dingdan);

		}

		String forwardurl = request.getParameter("forwardurl");
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
		srvorderSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String ddno = request.getParameter("ddno");
		String ydren = request.getParameter("ydren");
		String yddate = request.getParameter("yddate");
		String xdtime = request.getParameter("xdtime");
		String srvtype = request.getParameter("srvtype");
		String payfee = request.getParameter("payfee");
		String srvname = request.getParameter("srvname");
		String shaccount = request.getParameter("shaccount");
		String ydrname = request.getParameter("ydrname");
		String ydridcardno = request.getParameter("ydridcardno");
		String mobile = request.getParameter("mobile");
		String srvid = request.getParameter("srvid");
		String des = request.getParameter("des");
		SimpleDateFormat sdfsrvorder = new SimpleDateFormat("yyyy-MM-dd");
		Srvorder srvorder = new Srvorder();
		srvorder.setDdno(SequenceUtil.buildSequence("SO"));
		srvorder.setYdren(ydren == null ? "" : ydren);
		if (yddate != null) {
			try {
				srvorder.setYddate(sdfsrvorder.parse(yddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			srvorder.setYddate(new Date());
		}
		if (xdtime != null) {
			try {
				srvorder.setXdtime(sdfsrvorder.parse(xdtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			srvorder.setXdtime(new Date());
		}
		srvorder.setSrvtype(srvtype == null ? 0 : new Integer(srvtype));
		srvorder.setPayfee(payfee == null ? (double) 0 : new Double(payfee));
		srvorder.setSrvname(srvname == null ? "" : srvname);
		srvorder.setState(1);
		srvorder.setShaccount(shaccount==null?"":shaccount);
		srvorder.setYdrname(ydrname == null ? "" : ydrname);
		srvorder.setYdridcardno(ydridcardno == null ? "" : ydridcardno);
		srvorder.setMobile(mobile == null ? "" : mobile);
		srvorder.setSrvid(srvid == null ? 0 : new Integer(srvid));
		srvorder.setDes(des == null ? "" : des);
		srvorderSrv.save(srvorder);
		if (forwardurl == null) {
			forwardurl = "/admin/srvordermanager.do?actiontype=get";
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
			Srvorder srvorder = srvorderSrv.load("where id=" + id);
			if (srvorder != null) {
				request.setAttribute("srvorder", srvorder);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/srvorderadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String ydren=request.getParameter("ydren");
		String shaccount=request.getParameter("shaccount");
		String ddno = request.getParameter("ddno");
		if (ddno != null)
			filter += "  and ddno like '%" + ddno + "%'  ";
		//
		if(ydren!=null)
			filter+=" and ydren='"+ydren+"'";
		if(shaccount!=null)
			filter+=" and shaccount='"+shaccount+"'";
		
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
		List<Srvorder> listsrvorder = srvorderSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = srvorderSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listsrvorder", listsrvorder);
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
			forwardurl = "/admin/srvordermanager.jsp";
		}
		forward(forwardurl);
	}
}
