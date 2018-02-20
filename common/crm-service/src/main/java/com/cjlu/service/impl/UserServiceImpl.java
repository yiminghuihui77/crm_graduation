package com.cjlu.service.impl;

import com.cjlu.dao.CrmUserMapper;
import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import com.cjlu.service.CrmUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author minghui.y
 * @create 2018-02-15 15:20
 **/
@Service
public class UserServiceImpl implements CrmUserService {

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

    @Override
    public UserDTO queryUserDetailById(Integer id) {
        return crmUserMapper.selectUserDetailById(id);
    }

    @Override
    public List<UserDTO> queryNormalUsers() {
        return crmUserMapper.selectNormalUsers();
    }

    @Override
    public void addUesr(CrmUser crmUser) {
        crmUserMapper.insertUser(crmUser);
    }

    @Override
    public void removeUser(Integer id) {
        crmUserMapper.deleteUserById(id);
    }

    @Override
    public void refreshUser(UserDTO userDTO) {
        crmUserMapper.updateUser(userDTO);
    }

    @Override
    public void refreshPwd(UserDTO userDTO) {
        crmUserMapper.updatePwd(userDTO);
    }


}
