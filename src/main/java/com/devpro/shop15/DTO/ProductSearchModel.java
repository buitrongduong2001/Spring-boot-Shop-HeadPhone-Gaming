package com.devpro.shop15.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSearchModel extends BaseModel  {

    private String keyword;

    private Boolean priceSale;

    private Boolean isHot;

    private Integer categoryId;

    private BigDecimal priceStart;
    private BigDecimal priceEnd;
}
