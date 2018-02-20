package com.cjlu.dao;

import com.cjlu.domain.CrmUser;
import com.cjlu.model.UserDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CrmUserMapper {

    CrmUser selectByPrimaryKey(Integer id);

    /**登录*/
    CrmUser loginByDTO(UserDTO userDTO);

    /**根据用户id查询该用户详细信息*/
    UserDTO selectUserDetailById(Integer id);

    /**查询所有普通用户的详细信息*/
    List<UserDTO> selectNormalUsers();

    /**用户信息入库*/
    void insertUser(CrmUser crmUser);

    /**删除用户*/
    void deleteUserById(Integer id);

    void updateUser(UserDTO userDTO);

    /**修改密码*/
    void updatePwd(UserDTO userDTO);

    /**根据时间戳查询*/
    List<CrmUser> findListAfterLocalLastModifyTime(@Param("gmtModified")Date gmtModified);
}