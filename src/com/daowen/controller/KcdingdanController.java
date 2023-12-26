package com.daowen.controller;

import com.daowen.entity.Dingdan;
import com.daowen.entity.Huiyuan;
import com.daowen.entity.Kcdingdan;
import com.daowen.service.HuiyuanService;
import com.daowen.service.KcdingdanService;
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
 * 报名订单控制
 *
 */
@Controller
public class KcdingdanController extends SimpleController {
	@Autowired
	private KcdingdanService dingdanSrv = null;
	
	@Autowired
	private HuiyuanService huiyuanSrv=null;

	@Override
	@RequestMapping("/admin/kcdingdanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}
	
	
	public void payment() {

		String ddid = request.getParameter("ddid");
		
		String errorurl = request.getParameter("errorurl");
		
		String paypwd = request.getParameter("paypwd");

		if (ddid == null)
			return;

		Kcdingdan dingdan = dingdanSrv.load("where id=" + ddid);

		
		Huiyuan hy = huiyuanSrv.load("where accountname='"
				+ dingdan.getHyaccount() + "'");
		if ((paypwd != null && !paypwd.equals(hy.getPaypwd()))
				|| paypwd == null) {
			request.setAttribute("errormsg",
					"<label class='error'>支付密码不正确请重新输入</label>");
			forward(errorurl);
			return;
		}
		

		if (dingdan.getHyaccount() != null) {
			
			if (hy.getYue() < dingdan.getTotalfee()) {

				request.setAttribute("errormsg",
						"<label class='error'>账户余额不足于支付订单,请充值</label>");
				forward(errorurl);
				return;

			} else {

				hy.setYue((hy.getYue() - dingdan.getTotalfee()));

				huiyuanSrv.update(hy);

				dingdan.setState(2);
				dingdanSrv.update(dingdan);
				request.getSession().setAttribute("huiyuan", hy);
			}

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
		dingdanSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String ddno = request.getParameter("ddno");
		String kcname = request.getParameter("kcname");
		String kcid = request.getParameter("kcid");
		String skaddress = request.getParameter("skaddress");
		String jlaccount = request.getParameter("jlaccount");
		String jlname = request.getParameter("jlname");
		String renshu = request.getParameter("renshu");
		String fee = request.getParameter("fee");
		String xdtime = request.getParameter("xdtime");
		String mobile = request.getParameter("mobile");
		String hyaccount = request.getParameter("hyaccount");
		String hyname = request.getParameter("hyname");
		SimpleDateFormat sdfdingdan = new SimpleDateFormat("yyyy-MM-dd");
		Kcdingdan dingdan = new Kcdingdan();
		dingdan.setDdno(SequenceUtil.buildSequence("DD"));
		dingdan.setKcname(kcname == null ? "" : kcname);
		dingdan.setKcid(kcid == null ? 0 : new Integer(kcid));
		dingdan.setSkaddress(skaddress == null ? "" : skaddress);
		dingdan.setJlaccount(jlaccount == null ? "" : jlaccount);
		dingdan.setJlname(jlname == null ? "" : jlname);
		dingdan.setRenshu(renshu == null ? 0 : new Integer(renshu));
	
		dingdan.setFee(fee == null ? 0 :Double.parseDouble(fee));
		
		dingdan.setTotalfee(dingdan.getRenshu()*dingdan.getFee());
		if (xdtime != null) {
			try {
				dingdan.setXdtime(sdfdingdan.parse(xdtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			dingdan.setXdtime(new Date());
		}
		dingdan.setState(1);
		dingdan.setMobile(mobile == null ? "" : mobile);
		dingdan.setHyaccount(hyaccount == null ? "" : hyaccount);
		dingdan.setHyname(hyname == null ? "" : hyname);
		dingdanSrv.save(dingdan);
		if (forwardurl == null) {
			forwardurl = "/admin/dingdanmanager.do?actiontype=get";
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
			Dingdan dingdan = dingdanSrv.load("where id=" + id);
			if (dingdan != null) {
				request.setAttribute("dingdan", dingdan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/dingdanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String ddno = request.getParameter("ddno");
		String hyaccount=request.getParameter("hyaccount");
		if (ddno != null)
			filter += "  and ddno like '%" + ddno + "%'  ";
		if(hyaccount!=null)
			filter+=" and  hyaccount='"+hyaccount+"'";
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
		List<Kcdingdan> listdingdan = dingdanSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = dingdanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listdingdan", listdingdan);
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
			forwardurl = "/admin/dingdanmanager.jsp";
		}
		forward(forwardurl);
	}
}
