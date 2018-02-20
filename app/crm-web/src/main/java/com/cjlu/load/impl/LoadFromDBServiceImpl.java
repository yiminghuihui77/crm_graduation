package com.cjlu.load.impl;

import com.cjlu.cache.CacheWrapperService;
import com.cjlu.dao.CrmChanceMapper;
import com.cjlu.dao.CrmUserMapper;
import com.cjlu.domain.CrmChance;
import com.cjlu.domain.CrmUser;
import com.cjlu.load.LoadFromDBService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @author minghui.y
 * @create 2018-02-20 16:40
 **/
@Component
public class LoadFromDBServiceImpl implements LoadFromDBService,InitializingBean {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoadFromDBServiceImpl.class);

    /**缓存服务*/
    @Autowired
    private CacheWrapperService cacheWrapperService;

    /**用户表mapper*/
    @Autowired
    private CrmUserMapper userMapper;

    /**销售机会mapper*/
    @Autowired
    private CrmChanceMapper chanceMapper;

    /**
     * 没30秒从数据库加载一次
     */
    @Override
    @Scheduled(cron = "0/30 * * * * ?")
    public void loadFromDBToCache() {
        //加载用户表到缓存
        loadUsersFromDB();
        //加载销售机会表到缓存
        loadChanceFromDB();
    }

    /**
     * 当前类实例化后执行一次加载
     * @throws Exception
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        loadFromDBToCache();
    }

    /**
     * 加载用户表到缓存
     */
    private void loadUsersFromDB() {
        List<CrmUser> userList = userMapper.findListAfterLocalLastModifyTime(cacheWrapperService.getUserLastModifiedTime());
        if (CollectionUtils.isEmpty(userList)) {
            LOGGER.info("[用户表] 无新数据");
            return;
        }
        try {
            cacheWrapperService.refreshUserCache(userList);
            LOGGER.info("刷新 [用户表] 到缓存 [完成] >> 共" + userList.size() + "条");
        }catch (Exception e) {
            LOGGER.error("刷新 [用户表] 到缓存失败！", e);
        }
    }

    /**
     * 加载销售机会到缓存
     */
    private void loadChanceFromDB() {
        List<CrmChance> chanceList = chanceMapper.findListAfterLocalLastModifyTime(cacheWrapperService.getChanceLastModifiedTime());
        if (CollectionUtils.isEmpty(chanceList)) {
            LOGGER.info("[销售机会表] 无新数据");
            return;
        }
        try {
            cacheWrapperService.refreshChanceCache(chanceList);
            LOGGER.info("刷新 [销售机会表] 到缓存 [完成] >> 共" + chanceList.size() + "条");
        }catch (Exception e) {
            LOGGER.error("刷新 [销售机会表] 到缓存失败！", e);
        }
    }
}
