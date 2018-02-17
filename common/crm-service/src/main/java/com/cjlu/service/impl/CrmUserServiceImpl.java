package com.cjlu.service.impl;

import com.cjlu.dao.CrmUserMapper;
import com.cjlu.domain.CrmUser;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List<CrmUser> queryAllUsers() {

        return crmUserMapper.selectAllUsers();
    }
}
