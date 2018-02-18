package com.cjlu.service.impl;

import com.cjlu.dao.CrmUserMapper;
import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author minghui.y
 * @create 2018-02-15 15:20
 **/
@Service
public class CrmUserServiceImpl implements CrmUserService {

    @Autowired
    private CrmUserMapper crmUserMapper;


    @Override
    public CrmUser queryById(Integer id) {

        return crmUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public CrmUser login(UserDTO userDTO) {
        return crmUserMapper.loginByDTO(userDTO);
    }


}
