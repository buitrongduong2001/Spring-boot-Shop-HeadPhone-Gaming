package com.devpro.shop15.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    // mã sản phẩm
    private int productId;

    // tên sản phẩme
    private String productName;

    private Integer quantityStore;

    private String size;

    private String avatarProduct;

    // số lương sản phẩm
    private int quantity;

    // đơn giá sản phẩm
    private BigDecimal priceUnit;

    private BigDecimal priceUnitSale;
    //tổng tiền
    private BigDecimal totalPrice;

}
