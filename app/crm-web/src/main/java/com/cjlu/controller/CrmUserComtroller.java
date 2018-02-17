package com.cjlu.controller;

import com.cjlu.domain.CrmUser;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-15 15:47
 **/
@Controller
public class CrmUserComtroller {

    @Autowired
    private CrmUserService crmUserService;

    @RequestMapping(value = "listAllUsers")
    public String queryAllUsers(Model model) {
        List<CrmUser> userList = crmUserService.queryAllUsers();
        model.addAttribute("userList", userList);

        return "crmUserList";
    }
}
