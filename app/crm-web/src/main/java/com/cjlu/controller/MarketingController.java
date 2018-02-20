package com.cjlu.controller;

import com.cjlu.cache.CacheWrapperService;
import com.cjlu.domain.CrmChance;
import com.cjlu.domain.CrmUser;
import com.cjlu.model.ChanceDTO;
import com.cjlu.service.CrmChanceService;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 营销管理控制器
 * @author minghui.y
 * @create 2018-02-20 12:15
 **/
@Controller
@RequestMapping("/MarketingController")
public class MarketingController {

    @Autowired
    private CrmChanceService chanceService;

    /**缓存服务*/
    @Autowired
    private CacheWrapperService cacheWrapperService;

    @RequestMapping("/chanceList")
    public String chanceListMethod(Model model) {
        //从缓存中查询销售机会列表、用户列表
        List<CrmChance> chanceList = cacheWrapperService.getChanceCache();
        List<CrmUser> userList = cacheWrapperService.getUserCache();
        //填充创建人、指派人姓名属性
        List<ChanceDTO> chanceDTOS = chanceWrapper(chanceList, userList);
        model.addAttribute("chanceList", chanceDTOS);
        //跳转到销售机会列表页面
        return "sale/SaleChance";
    }

    @RequestMapping("/queryChanceByCusName")
    public String queryChanceByCusNameMethod(String cusName, Model model) {
        //调用相关服务模糊查询
        List<CrmChance> rawChances = cacheWrapperService.getChanceCache();
        List<CrmChance> chanceList = rawChances.stream()
                .filter((chance) -> chance.getCusName().contains(cusName))
                .collect(Collectors.toList());
        List<CrmUser> userList = cacheWrapperService.getUserCache();
        //填充创建人、指派人姓名属性
        List<ChanceDTO> chanceDTOS = chanceWrapper(chanceList, userList);
        model.addAttribute("chanceList", chanceDTOS);
        //跳转到销售机会列表页面
        return "sale/SaleChance";
    }

    @RequestMapping("/removeChance")
    public String deleteChanceMethod(Integer id) {
        //调用相关服务从数据库删除
        chanceService.removeChanceById(id);
        return "redirect:/MarketingController/chanceList.action";
    }

    @RequestMapping("/editChancePage")
    public String editChanceMethod(Integer id, Model model) {
        List<CrmChance> rawChances = cacheWrapperService.getChanceCache();
        CrmChance rawChance = rawChances.stream()
                .filter((chance -> chance.getId().intValue() == id))
                .findFirst()
                .get();
        List<CrmChance> chanceList = new ArrayList<>();
        chanceList.add(rawChance);
        List<CrmUser> userList = cacheWrapperService.getUserCache();
        //填充创建人、指派人姓名属性
        List<ChanceDTO> chanceDTOS = chanceWrapper(chanceList, userList);
        ChanceDTO chance = chanceDTOS.get(0);
        //查询出所有销售主管、客户经理
        List<CrmUser> saleMans = userList.stream()
                .filter((user) -> user.getRoleId().intValue() == 2)
                .collect(Collectors.toList());
        List<CrmUser> cusMans = userList.stream()
                .filter((user) -> user.getRoleId().intValue() == 3)
                .collect(Collectors.toList());
        //存储到model中
        model.addAttribute("chance", chance);
        model.addAttribute("saleMans", saleMans);
        model.addAttribute("cusMans", cusMans);
        return "sale/EditChancePage";
    }

    @RequestMapping("/editChance")
    public String editChanceMethod(ChanceDTO chanceDTO) {
        //调用相关服务修改到数据库中
        chanceService.refreshChance(chanceDTO);
        //重定向到销售机会列表页面
        return "redirect:/MarketingController/chanceList.action";
    }



    /*********************************************内置方法*****************************************/

    /**
     * 销售机会包装
     * @param chanceList
     * @param userList
     * @return
     */
    private List<ChanceDTO> chanceWrapper(List<CrmChance> chanceList, List<CrmUser> userList) {
        if (CollectionUtils.isEmpty(chanceList) || CollectionUtils.isEmpty(userList)) {
            return new ArrayList<>();
        }
        List<ChanceDTO> chanceDTOS = new ArrayList<>(chanceList.size());
        chanceList.forEach((chance) -> {
            ChanceDTO chanceDTO = new ChanceDTO();
            //属性拷贝
            BeanUtils.copyProperties(chance, chanceDTO);
            //填充创建人姓名属性
            Integer createId = chance.getCreateId();
            String createName = userList.stream()
                    .filter((user) -> user.getId().intValue() == createId.intValue())
                    .findFirst()
                    .get()
                    .getName();
            chanceDTO.setCreateName(createName);
            //填充指派人姓名属性
            Integer dueId = chance.getDueId();
            String dueName = userList.stream()
                    .filter((user) -> user.getId().intValue() == dueId)
                    .findFirst()
                    .get()
                    .getName();
            chanceDTO.setDueName(dueName);

            chanceDTOS.add(chanceDTO);
        });

        return chanceDTOS;
    }
}
