package com.cjlu.dao;

import com.cjlu.domain.CrmCustomer;
import com.cjlu.domain.CrmUser;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;

@Repository
public interface CrmCustomerMapper {
    CrmCustomer selectByPrimaryKey(Integer id);

    /**添加客户*/
    void insertCustomer(CrmCustomer customer);

    /**修改客户的状态*/
    void updateStatus(CrmCustomer customer);

    /**查询指定客户经理ID和ENABLE状态的客户*/
    List<CrmCustomer> selectByIdAndStatus(Integer id);

    /**根据客户名称进行模糊查询*/
    List<CrmCustomer> selectLikeName(String cusName);

    /**删除客户*/
    void deleteCustomer(Integer id);

    /**修改客户信息*/
    void updateCustomer(CrmCustomer customer);

}