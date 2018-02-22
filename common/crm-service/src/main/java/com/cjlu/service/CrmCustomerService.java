package com.cjlu.service;

import com.cjlu.domain.CrmCustomer;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-21 18:26
 **/
public interface CrmCustomerService {
    /**添加客户*/
    void addCustomer(CrmCustomer customer);

    /**更新客户状态*/
    void refreshStatus(CrmCustomer customer);

    /**查询指定客户经理的Enable状态的客户*/
    List<CrmCustomer> queryByIdAndStatus(Integer id);

    /**根据客户姓名模糊查询*/
    List<CrmCustomer> queryByCusName(String cusName);

    /**删除客户*/
    void removeCustomer(Integer id);

    /**根据主键id查询客户*/
    CrmCustomer queryById(Integer id);

    /**更新客户信息*/
    void refreshCustomer(CrmCustomer customer);



}
