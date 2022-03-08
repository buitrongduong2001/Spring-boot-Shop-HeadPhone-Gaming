package com.devpro.shop15.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategorySearchModel extends BaseModel {
    private String keyword;

    private Integer categoryId;
}
