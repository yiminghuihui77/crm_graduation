package com.cjlu.controller;

import com.cjlu.domain.CrmUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 系统管理控制器
 * @author minghui.y
 * @create 2018-02-17 18:03
 **/
@Controller
@RequestMapping("/SystemController")
public class SystemController {

    @RequestMapping("/login")
    public String login_method(HttpServletRequest request, HttpServletResponse response,
                               CrmUser crmUser, Model model) throws Exception {
        return "home/home";
    }

}
