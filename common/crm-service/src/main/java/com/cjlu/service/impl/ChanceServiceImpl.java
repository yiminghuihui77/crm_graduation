package com.cjlu.service.impl;

import com.cjlu.dao.CrmChanceMapper;
import com.cjlu.domain.CrmChance;
import com.cjlu.model.ChanceDTO;
import com.cjlu.service.CrmChanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-20 15:32
 **/
@Service
public class ChanceServiceImpl implements CrmChanceService {

    @Autowired
    private CrmChanceMapper chanceMapper;

    @Override
    public List<ChanceDTO> queryChanceList() {
        return chanceMapper.selectChances();
    }

    @Override
    public void removeChanceById(Integer id) {
        chanceMapper.deleteChanceById(id);
    }

    @Override
    public void refreshChance(CrmChance chance) {
        chanceMapper.updateChance(chance);
    }

    @Override
    public void addChance(CrmChance chance) {
        chanceMapper.addChance(chance);
    }
}
