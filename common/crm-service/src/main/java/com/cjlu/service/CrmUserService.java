package com.cjlu.service;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;

/**
 * @author minghui.y
 * @create 2018-02-15 15:18
 **/
public interface CrmUserService {

    CrmUser queryById(Integer id);

    /**服务*/
    CrmUser login(UserDTO userDTO);
}
