package com.cjlu.model;

import lombok.Data;
import lombok.ToString;

/**
 * @author minghui.y
 * @create 2018-02-20 13:23
 **/
@Data
@ToString
public class ChanceDTO
{
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

    /**创建人姓名*/
    private String createName;

    /** 指派人编号(客户经理) */
    private Integer dueId;

    /**指派人姓名*/
    private String dueName;

    /** 机会状态：0未指派1已指派 */
    private Integer status;
}
