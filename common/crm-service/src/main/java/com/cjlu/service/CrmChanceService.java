package com.cjlu.service;


import com.cjlu.model.ChanceDTO;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-20 15:31
 **/
public interface CrmChanceService {

    List<ChanceDTO> queryChanceList();

    /**删除销售机会*/
    void removeChanceById(Integer id);

    /**更新销售机会*/
    void refreshChance(ChanceDTO chanceDTO);
}
