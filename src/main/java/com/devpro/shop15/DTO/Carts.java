package com.devpro.shop15.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Carts {
    // tổng số tiền trong giỏ hàng
    private BigDecimal totalPrice = BigDecimal.ZERO;

    // danh sách sản phẩm trong giỏ hàng
    private List<CartItem> cartItems = new ArrayList<>();
}
