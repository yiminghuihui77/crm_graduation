package com.cjlu.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CrmUser {
    /**  */
    private Integer id;

    /**  */
    private String name;

    /**  */
    private String password;

    /**  */
    private Integer roleId;

    /**  */
    private Integer flag;
}