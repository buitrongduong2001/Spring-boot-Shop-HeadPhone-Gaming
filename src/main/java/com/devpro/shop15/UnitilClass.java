package com.devpro.shop15;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.math.BigDecimal;
import java.security.SecureRandom;

public class UnitilClass {
    public static void main(String[] args) {
        SecureRandom secureRandom = new SecureRandom();
        Integer randomWithSecureRandomWithinARange = secureRandom.nextInt(99999999 - 1) + 1;
        String num =  "011"+randomWithSecureRandomWithinARange.toString();

//        System.out.println(Integer.parseInt(num));

//        BigDecimal bigDecimal = BigDecimal.valueOf(6);
//        System.out.println(bigDecimal);
    }
}
