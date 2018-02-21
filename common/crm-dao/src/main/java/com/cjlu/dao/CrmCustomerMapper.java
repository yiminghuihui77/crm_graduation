package com.cjlu.dao;

import com.cjlu.domain.CrmCustomer;
import org.springframework.stereotype.Repository;

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
}