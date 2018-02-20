package com.cjlu.dao;

import com.cjlu.domain.CrmChance;
import com.cjlu.model.ChanceDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CrmChanceMapper {
    CrmChance selectByPrimaryKey(Integer id);

    /**销售机会列表*/
    List<ChanceDTO> selectChances();

    /**根据时间戳查询*/
    List<CrmChance> findListAfterLocalLastModifyTime(@Param("gmtModified")Date gmtModified);

    /**删除销售机会*/
    void deleteChanceById(Integer id);

    /**修改销售机会*/
    void updateChance(ChanceDTO chanceDTO);
}