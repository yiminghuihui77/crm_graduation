package com.cjlu.cache;

import com.cjlu.domain.CrmChance;
import com.cjlu.domain.CrmUser;

import java.util.Date;
import java.util.List;

/**
 * 缓存服务
 * @author minghui.y
 * @create 2018-02-20 15:43
 **/
public interface CacheWrapperService {

    /**获取时间戳方法*/
    Date getUserLastModifiedTime();
    Date getChanceLastModifiedTime();

    /**刷新缓存的方法*/
    void refreshUserCache(List<CrmUser> userList);
    void refreshChanceCache(List<CrmChance> chanceList);

    /**获取缓存的方法*/
    List<CrmUser> getUserCache();
    List<CrmChance> getChanceCache();
}
