package com.cjlu.service.impl;

import com.cjlu.dao.CrmActivityMapper;
import com.cjlu.domain.CrmActivity;
import com.cjlu.model.DateSection;
import com.cjlu.service.CrmActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-22 20:21
 **/
@Service
public class ActivityServiceImpl implements CrmActivityService {

    @Autowired
    private CrmActivityMapper activityMapper;

    @Override
    public List<CrmActivity> queryByCusId(Integer id) {
        return activityMapper.selectByCusId(id);
    }

    @Override
    public List<CrmActivity> queryByDate(DateSection dateSection) {
        return activityMapper.selectByDate(dateSection);
    }

    @Override
    public void removeActivity(Integer id) {
        activityMapper.deleteById(id);
    }

    @Override
    public CrmActivity queryById(Integer id) {
        return activityMapper.selectByPrimaryKey(id);
    }

    @Override
    public void refreshActivity(CrmActivity activity) {
        activityMapper.updateActivity(activity);
    }

    @Override
    public void addActivity(CrmActivity activity) {
        activityMapper.addActivity(activity);
    }
}
