package com.cjlu.service;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-15 15:18
 **/
public interface CrmUserService {

    CrmUser queryById(Integer id);

    /**登录*/
    CrmUser login(UserDTO userDTO);

    /**查询用户详细信息*/
    UserDTO queryUserDetailById(Integer id);

    /**查询所有普通用户的详细信息*/
    List<UserDTO> queryNormalUsers();

    /**添加新用户*/
    void addUesr(CrmUser crmUser);

    /**删除用户*/
    void removeUser(Integer id);

    /**更新用户信息*/
    void refreshUser(UserDTO userDTO);

    /** 更新密码 */
    void refreshPwd(UserDTO userDTO);
}
