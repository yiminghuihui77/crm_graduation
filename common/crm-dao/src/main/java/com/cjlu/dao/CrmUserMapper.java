package com.cjlu.dao;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface CrmUserMapper {
    CrmUser selectByPrimaryKey(Integer id);

    /**登录*/
    CrmUser loginByDTO(UserDTO userDTO);
}