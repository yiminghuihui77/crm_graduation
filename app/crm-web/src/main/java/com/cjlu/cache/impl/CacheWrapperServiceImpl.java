package com.cjlu.cache.impl;

import com.cjlu.cache.CacheWrapperService;
import com.cjlu.domain.CrmChance;
import com.cjlu.domain.CrmUser;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 充当一个数据表容器，维护一张时间戳map
 * @author minghui.y
 * @create 2018-02-20 15:44
 **/
@Service
public class CacheWrapperServiceImpl implements CacheWrapperService {

    /**用户表缓存*/
    private static final Map<Integer, CrmUser> CACHE_USERS = new ConcurrentHashMap<>();

    /**销售机会表缓存*/
    private static final Map<Integer, CrmChance> CACHE_CHANCES = new ConcurrentHashMap<>();

    /**各个缓存的更新时间戳缓存*/
    private static final String LAST_MODIFIED_TIME_USERS = "LAST_MODIFIED_TIME_USERS";
    private static final String LAST_MODIFIED_TIME_CHANCES = "LAST_MODIFIED_TIME_CHANCES";
    private static final Map<String, Date> CACHE_LAST_MODIFIED_TIME = new ConcurrentHashMap<>();

    /*********************时间戳Getter、Setter方法************************/
    private Date getLastModifiedTime(String key) {
        return CACHE_LAST_MODIFIED_TIME.get(key);
    }
    private void setLastModifiedTime(String key, Date time) {

        CACHE_LAST_MODIFIED_TIME.put(key, time);
    }
    /**用户表缓存*/
    @Override
    public Date getUserLastModifiedTime() {
        return getLastModifiedTime(LAST_MODIFIED_TIME_USERS);
    }
    private void setUserLastModifiedTime(Date time) {
        setLastModifiedTime(LAST_MODIFIED_TIME_USERS, time);
    }
    /**销售机会表缓存*/
    @Override
    public Date getChanceLastModifiedTime() {
        return getLastModifiedTime(LAST_MODIFIED_TIME_CHANCES);
    }
    private void setChanceLastModifiedTime(Date time) {
        setLastModifiedTime(LAST_MODIFIED_TIME_CHANCES, time);
    }


    /*********************刷新缓存的方法************************/
    @Override
    public void refreshUserCache(List<CrmUser> userList) {
        if (CollectionUtils.isEmpty(userList)) {
            return;
        }
        //当前业务上次最后更新时间
        Date lastModifiedTime = getUserLastModifiedTime();
        for (CrmUser user : userList) {
            //刷新到缓存
            CACHE_USERS.put(user.getId(), user);

            //更新时间戳
            if (lastModifiedTime == null || user.getGmtModified().after(lastModifiedTime)) {
                lastModifiedTime = user.getGmtModified();
            }
        }
        //更新时间戳缓存
        setUserLastModifiedTime(lastModifiedTime);
    }

    @Override
    public void refreshChanceCache(List<CrmChance> chanceList) {
        if (CollectionUtils.isEmpty(chanceList)) {
            return;
        }
        //当前业务最后更新时间
        Date lastModifiedTime = getChanceLastModifiedTime();
        for (CrmChance chance : chanceList) {
            //刷新到缓存
            CACHE_CHANCES.put(chance.getId(), chance);

            //更新时间戳
            if (lastModifiedTime == null || chance.getGmtModified().after(lastModifiedTime)) {
                lastModifiedTime = chance.getGmtModified();
            }
        }
        //更新时间戳缓存
        setChanceLastModifiedTime(lastModifiedTime);
    }

    /*********************获取缓存的方法************************/
    @Override
    public List<CrmUser> getUserCache() {
        return CACHE_USERS.values().stream()
                .collect(Collectors.toList());
    }

    @Override
    public List<CrmChance> getChanceCache() {
        return CACHE_CHANCES.values().stream()
                .collect(Collectors.toList());
    }
}
