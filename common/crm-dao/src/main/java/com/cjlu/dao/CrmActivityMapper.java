package com.cjlu.dao;

import com.cjlu.domain.CrmActivity;
import com.cjlu.model.DateSection;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CrmActivityMapper {
    CrmActivity selectByPrimaryKey(Integer id);

    /**根据客户ID查询交往记录*/
    List<CrmActivity> selectByCusId(Integer id);

    /**根据日期查询交往记录*/
    List<CrmActivity> selectByDate(DateSection dateSection);

    /**根据id删除交往记录*/
    void deleteById(Integer id);

    /**修改交往记录*/
    void updateActivity(CrmActivity activity);

    /**添加交往记录*/
    void addActivity(CrmActivity activity);

}