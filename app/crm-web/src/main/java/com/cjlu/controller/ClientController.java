package com.cjlu.controller;

import com.cjlu.domain.CrmActivity;
import com.cjlu.domain.CrmCustomer;
import com.cjlu.model.DateSection;
import com.cjlu.service.CrmActivityService;
import com.cjlu.service.CrmCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 客户服务控制器
 * @author minghui.y
 * @create 2018-02-21 21:45
 **/
@Controller
@RequestMapping("/ClientController")
public class ClientController {

    @Autowired
    private CrmCustomerService customerService;
    @Autowired
    private CrmActivityService activityService;

    @RequestMapping("/queryCustomers")
    public String queryCustomersMethod(HttpServletRequest request, Model model) {
        //获取session域中当前登录用户(客户经理)的id
        Integer id = (Integer) request.getSession().getAttribute("userId");
        //调用相关服务查询客户列表
        List<CrmCustomer> customerList = customerService.queryByIdAndStatus(id);
        model.addAttribute("customerList", customerList);
        //跳转到客户列表页面
        return "client/ClientList";
    }

    @RequestMapping("/queryByCusName")
    public String queryByCusNameMethod(String cusName, Model model) {
        if (StringUtils.isEmpty(cusName)) {
            return "redirect:/ClientController/queryCustomers.action";
        }
        //调用相关服务队客户名称进行模糊查询
        List<CrmCustomer> customerList = customerService.queryByCusName(cusName);
        if (!CollectionUtils.isEmpty(customerList)) {
            model.addAttribute("customerList", customerList);
        }
        return "client/ClientList";
    }

    @RequestMapping("/removeCustomer")
    public String removeCustomerMethod(Integer id) {
        //调用相关服务删除客户
        customerService.removeCustomer(id);
        //重定向到库尔胡列表页面
        return "redirect:/ClientController/queryCustomers.action";
    }

    @RequestMapping("/editCustomerPage")
    public String editCustomerPageMethod(Integer id, Model model) {
        //根据id查询出该客户
        CrmCustomer customer = customerService.queryById(id);
        model.addAttribute("customer", customer);
        //跳转到编辑客户页面
        return "client/EditCustomerPage";
    }

    @RequestMapping("/editCustomer")
    public String editCustomerMethod(CrmCustomer customer, HttpServletRequest request) {
        //数据校验

        //调用相关服务修改入库
        customer.setGmtModified(new Date());
        customerService.refreshCustomer(customer);
        //重定向到客户列表页面
        return "redirect:/ClientController/queryCustomers.action";
    }

    @RequestMapping("/activityDetail")
    public String activityDetailMethod(Integer id, Model model, HttpServletRequest request) {
        //客户id存储到session域中（修改交往记录后跳转到列表页面要用）
        request.getSession().setAttribute("cusId", id);
        //调用相关服务查询指定客户ID的交往记录
        List<CrmActivity> activityList = activityService.queryByCusId(id);
        //存储到Model中
        model.addAttribute("activityList", activityList);
        //跳转到交往记录页面
        return "client/ActivityList";
    }

    @RequestMapping("/queryByDate")
    public String queryByDateMethod(DateSection dateSection, Model model) {
        //调用相关服务进行查询
        List<CrmActivity> activityList = activityService.queryByDate(dateSection);
        //存储到Model中
        model.addAttribute("activityList", activityList);
        //跳转到交往记录列表页面
        return "client/ActivityList";
    }

    @RequestMapping("/removeActivity")
    public String removeActivityMethod(Integer id) {
        //调用相关服务删除交往记录
        activityService.removeActivity(id);
        //重定向到交往记录列表页面
        return "redirect:/ClientController/activityDetail.action";
    }

    @RequestMapping("/editActivityPage")
    public String editActivityPageMethod(Integer id, Model model) {
        //调用相关服务，根据id交往记录
        CrmActivity activity = activityService.queryById(id);
        //存储到Model中
        model.addAttribute("activity", activity);
        //跳转到编辑页面
        return "client/EditActivityPage";
    }

    @RequestMapping("/editActivity")
    public String editActivityMethod(CrmActivity activity, HttpServletRequest request) {
        //调用相关服务修改入库
        activity.setGmtModified(new Date());
        activityService.refreshActivity(activity);
        //重定向到交往记录列表页面
        Integer cusId = (Integer)request.getSession().getAttribute("cusId");
        return "redirect:/ClientController/activityDetail.action?id=" + cusId;
    }

    @RequestMapping("/addActivityPage")
    public String addActivityPageMethod() {
       //直接跳转到添加页面
        return "client/AddActivityPage";
    }

    @RequestMapping("/addActivity")
    public String addActivityMethod(HttpServletRequest request, CrmActivity activity) {
        Integer cusId = (Integer)request.getSession().getAttribute("cusId");
        activity.setCusId(cusId);
        activity.setGmtCreated(new Date());
        activity.setGmtModified(new Date());
        //调用相关服务将数据入库
        activityService.addActivity(activity);

        //重定向到交往记录列表页面
        return "redirect:/ClientController/activityDetail.action?id=" + cusId;
    }



}
