package com.cjlu.service;

import com.cjlu.domain.CrmActivity;
import com.cjlu.model.DateSection;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-22 20:18
 **/
public interface CrmActivityService {

    /**根据客户id查询交往记录*/
    List<CrmActivity> queryByCusId(Integer id);

    /**根据日期区间查询交往记录*/
    List<CrmActivity> queryByDate(DateSection dateSection);

    /**根据id删除交往记录*/
    void removeActivity(Integer id);

    /**根据id查询交往记录*/
    CrmActivity queryById(Integer id);

    /**更新交往记录*/
    void refreshActivity(CrmActivity activity);

    /**添加交往记录*/
    void addActivity(CrmActivity activity);

}
