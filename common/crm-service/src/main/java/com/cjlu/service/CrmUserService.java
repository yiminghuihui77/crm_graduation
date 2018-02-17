package com.cjlu.service;

import com.cjlu.domain.CrmUser;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-15 15:18
 **/
public interface CrmUserService {

    CrmUser queryById(Integer id);

    List<CrmUser> queryAllUsers();
}
