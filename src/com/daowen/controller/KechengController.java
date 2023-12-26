package com.daowen.controller;

import com.daowen.entity.Kecheng;
import com.daowen.service.KechengService;
import com.daowen.service.ZhiyuanService;
import com.daowen.ssm.simplecrud.SimpleController;
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
 * 培训课程控制
 *
 */
@Controller
public class KechengController extends SimpleController {
    @Autowired
    private KechengService kechengSrv = null;
    @Autowired
    private ZhiyuanService teacherSrv = null;

    @Override
    @RequestMapping("/admin/kechengmanager.do")
    public void mapping(HttpServletRequest request, HttpServletResponse response) {
        mappingMethod(request, response);
    }

    /********************************************************
     ******************信息注销监听支持*****************************
     *********************************************************/
    public void delete() {
        String[] ids = request.getParameterValues("ids");
        if (ids == null)
            return;
        String spliter = ",";
        String SQL = " where id in(" + join(spliter, ids)
                + ")";
        System.out.println("sql=" + SQL);
        kechengSrv.delete(SQL);
    }

    /*************************************************************
     ****************保存动作监听支持******************************
     **************************************************************/
    public void save() {
        String forwardurl = request.getParameter("forwardurl");
        //验证错误url
        String errorurl = request.getParameter("errorurl");
        String title = request.getParameter("title");
        String keshi = request.getParameter("keshi");
        String tupian = request.getParameter("tupian");
        String skshijian = request.getParameter("skshijian");
        String fee = request.getParameter("fee");
        String createtime = request.getParameter("createtime");
        String des = request.getParameter("des");
        String tno = request.getParameter("tno");
        String tname = request.getParameter("tname");
        SimpleDateFormat sdfkecheng = new SimpleDateFormat("yyyy-MM-dd");
        Kecheng kecheng = new Kecheng();
        kecheng.setTitle(title == null ? "" : title);
        kecheng.setKeshi(keshi == null ? "" : keshi);
        kecheng.setTupian(tupian == null ? "" : tupian);
        kecheng.setSkshijian(skshijian == null ? "" : skshijian);
        kecheng.setFee(fee == null ? 0 : new Integer(fee));
        if (createtime != null) {
            try {
                kecheng.setCreatetime(sdfkecheng.parse(createtime));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            kecheng.setCreatetime(new Date());
        }
        kecheng.setDes(des == null ? "" : des);
        kecheng.setTno(tno == null ? "" : tno);
        kecheng.setTname(tname == null ? "" : tname);
        kechengSrv.save(kecheng);
        if (forwardurl == null) {
            forwardurl = "/admin/kechengmanager.do?actiontype=get";
        }
        redirect(forwardurl);
    }

    /******************************************************
     ***********************更新内部支持*********************
     *******************************************************/
    public void update() {
        String forwardurl = request.getParameter("forwardurl");
        String id = request.getParameter("id");
        if (id == null)
            return;
        Kecheng kecheng = kechengSrv.load(new Integer(id));
        if (kecheng == null)
            return;
        String title = request.getParameter("title");
        String keshi = request.getParameter("keshi");
        String tupian = request.getParameter("tupian");
        String skshijian = request.getParameter("skshijian");
        String fee = request.getParameter("fee");
        String createtime = request.getParameter("createtime");
        String des = request.getParameter("des");
        String tno = request.getParameter("tno");
        String tname = request.getParameter("tname");
        SimpleDateFormat sdfkecheng = new SimpleDateFormat("yyyy-MM-dd");
        kecheng.setTitle(title);
        kecheng.setKeshi(keshi);
        kecheng.setTupian(tupian);
        kecheng.setSkshijian(skshijian);
        kecheng.setFee(fee == null ? 0 : new Integer(fee));
        if (createtime != null) {
            try {
                kecheng.setCreatetime(sdfkecheng.parse(createtime));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        kecheng.setDes(des);
        kecheng.setTno(tno);
        kecheng.setTname(tname);
        kechengSrv.update(kecheng);
        if (forwardurl == null) {
            forwardurl = "/admin/kechengmanager.do?actiontype=get";
        }
        redirect(forwardurl);
    }

    /******************************************************
     ***********************加载内部支持*********************
     *******************************************************/
    public void load() {
        //
        String id = request.getParameter("id");
        String actiontype = "save";
        dispatchParams(request, response);
        if (id != null) {
            Kecheng kecheng = kechengSrv.load("where id=" + id);
            if (kecheng != null) {
                request.setAttribute("kecheng", kecheng);
            }
            actiontype = "update";
            request.setAttribute("id", id);
        }
        request.setAttribute("actiontype", actiontype);
        List<Object> tno_datasource = teacherSrv.getEntity("");
        request.setAttribute("tno_datasource", tno_datasource);
        String forwardurl = request.getParameter("forwardurl");
        System.out.println("forwardurl=" + forwardurl);
        if (forwardurl == null) {
            forwardurl = "/admin/kechengadd.jsp";
        }
        forward(forwardurl);
    }

    /******************************************************
     ***********************数据绑定内部支持*********************
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
        List<Kecheng> listkecheng = kechengSrv.getPageEntitys(filter, pageindex, pagesize);
        int recordscount = kechengSrv.getRecordCount(filter == null ? "" : filter);
        request.setAttribute("listkecheng", listkecheng);
        PagerMetal pm = new PagerMetal(recordscount);
        //设置尺寸
        pm.setPagesize(pagesize);
        //设置当前显示页
        pm.setCurpageindex(pageindex);
        // 设置分页信息
        request.setAttribute("pagermetal", pm);
        //分发请求参数
        dispatchParams(request, response);
        String forwardurl = request.getParameter("forwardurl");
        System.out.println("forwardurl=" + forwardurl);
        if (forwardurl == null) {
            forwardurl = "/admin/kechengmanager.jsp";
        }
        forward(forwardurl);
    }
}
