package com.cjlu.domain;

import java.util.Date;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by minghui.y on 2018.02.20
 */
@Data
@ToString
public class CrmChance {
    /** 主键 */
    private Integer id;

    /** 机会来源 */
    private String source;

    /** 客户名称 */
    private String cusName;

    /** 客户电话 */
    private String phone;

    /** 成功几率 */
    private Integer successRate;

    /** 机会描述 */
    private String chanceDesc;

    /** 创建人编号(销售主管) */
    private Integer createId;

    /** 指派人编号(客户经理) */
    private Integer dueId;

    /** 机会状态：0未指派1已指派 */
    private Integer status;

    /** 创建时间 */
    private Date gmtCreated;

    /** 修改时间 */
    private Date gmtModified;
}