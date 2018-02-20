package com.cjlu.controller;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
    public String loginMethod(HttpServletRequest request, HttpServletResponse response,
                               UserDTO userDTO, Model model) {
        //表单数据后端校验(包括验证码)
        String inputYzm = userDTO.getYzm();
        String rawYzm = (String)request.getSession().getAttribute("yzm");
        if (!rawYzm.equalsIgnoreCase(inputYzm)) {
            model.addAttribute("loginErr", "验证码有误，请重新输入！");
            return "home/login";
        }
        //调用相关服务从数据库查询
        CrmUser loginUser = userService.login(userDTO);

        //根据查询结果做不同的跳转处理
        if (loginUser == null) {
            return "home/login";
        }
        //登录成功，提取用户信息存储到session域中
        //查询用户详细信息
        UserDTO userDetail = userService.queryUserDetailById(loginUser.getId());
        if (userDetail !=null) {
            request.getSession().setAttribute("userId", userDetail.getId());
            request.getSession().setAttribute("userName", userDetail.getName());
            request.getSession().setAttribute("password", userDetail.getPassword());
            request.getSession().setAttribute("roleName", userDetail.getRoleName());
            request.getSession().setAttribute("rightUrl", userDetail.getRightUrl());
        }

        return "home/home";
    }

    @RequestMapping("/userList")
    public String userListMethod(HttpServletRequest request) {
        //查询所有普通用户的信息，存储到request域中
        List<UserDTO> normalUsers = userService.queryNormalUsers();
        request.setAttribute("normalUsers", normalUsers);
        //跳转到显示页面
        return "admin/UserList";
    }

    @RequestMapping("/addUserPage")
    public String addUserPageMethod() {
        return "admin/addUserPage";
    }

    @RequestMapping("/addUser")
    public String addUserMethod(CrmUser crmUser) {
        //表单数据校验

        //调用相关服务插入到数据库
        crmUser.setGmtCreated(new Date());
        crmUser.setGmtModified(new Date());
        userService.addUesr(crmUser);
        //重定向到用户列表页面
        return "redirect:/SystemController/userList.action";
    }

    @RequestMapping("/removeUser")
    public String removeUserMethod(Integer id) {
        //调用相关服务从数据库删除
        userService.removeUser(id);
        //跳转到用户列表页面
        return "redirect:/SystemController/userList.action";
    }

    @RequestMapping("/editUserPage")
    public String editUserPageMethod(Integer id, HttpServletRequest request) {
        //根据id查询用户信息
        UserDTO editUser = userService.queryUserDetailById(id);

        //存储到request域中
        request.setAttribute("editUser", editUser);

        //跳转到编辑页面中
        return "admin/EditUserPage";
    }

    @RequestMapping("/editUser")
    public String editUserMethod(UserDTO userDTO) {
        //表单数据校验

        //调用相关服务修改数据库
        userService.refreshUser(userDTO);
        //跳转到用户列表页面
        return "redirect:/SystemController/userList.action";
    }

    @RequestMapping("/editPwdPage")
    public String editPwdPageMethod() {
        //跳转到编辑密码页面
        return "admin/EditPwd";
    }

    @RequestMapping("/editPwd")
    public String editPwdMethod(HttpServletRequest request, HttpServletResponse response, Model model,
                                Integer id, String oldPassword, String newPassword) throws Exception {
        //原密码与session域密码比较
        String password = (String)request.getSession().getAttribute("password");
        if (oldPassword != null && password != null && !oldPassword.equals(password)) {
            model.addAttribute("editPwdErr", "您输入的密码有误,请确认!");
            return "admin/EditPwd";
        }
        //密码校验

        //调用相关服务修改入库
        UserDTO userDTO = new UserDTO();
        userDTO.setId(id);
        userDTO.setPassword(newPassword);
        userService.refreshPwd(userDTO);
        //刷新session域中的密码
        request.getSession().setAttribute("password", newPassword);
        //跳转到main页面
        request.getRequestDispatcher("/component/main.jsp").forward(request, response);
        return null;
    }


}
