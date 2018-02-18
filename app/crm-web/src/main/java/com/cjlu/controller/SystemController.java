package com.cjlu.controller;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private CrmUserService userService;

    @RequestMapping("/login")
    public String login_method(HttpServletRequest request, HttpServletResponse response,
                               UserDTO userDTO, Model model) throws Exception {
        //表单数据后端校验

        //调用相关服务从数据库查询
        CrmUser loginUser = userService.login(userDTO);

        //根据查询结果做不同的跳转处理
        if (loginUser == null) {
            return "home/login";
        }
        //登录成功，提取用户信息存储到session域中
        request.getSession().setAttribute("userName", loginUser.getName());
        request.getSession().setAttribute("roleId", loginUser.getRoleId());

        System.out.println("hello world!");
        return "home/home";
    }

}
