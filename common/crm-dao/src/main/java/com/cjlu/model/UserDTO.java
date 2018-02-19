package com.cjlu.model;

import lombok.Data;
import lombok.ToString;

/**
 * @author minghui.y
 * @create 2018-02-18 22:57
 **/

@Data
@ToString
public class UserDTO {
    /** 编号 */
    private Integer id;

    /** 姓名 */
    private String name;

    /** 密码 */
    private String password;

    /** 状态 */
    private String status;

    /** 角色编号 */
    private Integer roleId;

    /** 角色名称 */
    private String roleName;

    /** 权限URL */
    private String rightUrl;

    /** 验证码 */
    private String yzm;
}
