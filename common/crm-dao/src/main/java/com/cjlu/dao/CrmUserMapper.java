package com.cjlu.dao;

import com.cjlu.domain.CrmUser;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface CrmUserMapper {
    CrmUser selectByPrimaryKey(Integer id);

    List<CrmUser> selectAllUsers();
}