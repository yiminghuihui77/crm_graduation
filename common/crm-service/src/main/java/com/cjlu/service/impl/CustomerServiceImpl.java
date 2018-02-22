package com.cjlu.service.impl;

import com.cjlu.dao.CrmCustomerMapper;
import com.cjlu.domain.CrmCustomer;
import com.cjlu.service.CrmCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-21 18:27
 **/
@Service
public class CustomerServiceImpl implements CrmCustomerService {

    @Autowired
    private CrmCustomerMapper customerMapper;

    @Override
    public void addCustomer(CrmCustomer customer) {
        customerMapper.insertCustomer(customer);
    }

    @Override
    public void refreshStatus(CrmCustomer customer) {
        customerMapper.updateStatus(customer);
    }

    @Override
    public List<CrmCustomer> queryByIdAndStatus(Integer id) {
        return customerMapper.selectByIdAndStatus(id);
    }

    @Override
    public List<CrmCustomer> queryByCusName(String cusName) {
        return customerMapper.selectLikeName(cusName);
    }

    @Override
    public void removeCustomer(Integer id) {
        customerMapper.deleteCustomer(id);
    }

    @Override
    public CrmCustomer queryById(Integer id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    @Override
    public void refreshCustomer(CrmCustomer customer) {
        customerMapper.updateCustomer(customer);
    }
}
