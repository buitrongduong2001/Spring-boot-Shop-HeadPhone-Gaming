package com.devpro.shop15.DTO;

import lombok.Data;

@Data
public class OrdersSearchModel extends BaseModel {

    private String keyword;

    private Integer statusOrder;

    private Integer code;

    private Integer idUser;

}
