package com.cjlu.controller;

import com.cjlu.domain.CrmCustomer;
import com.cjlu.service.CrmCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
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


}
