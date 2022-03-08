package com.devpro.shop15.services;

import com.github.slugify.Slugify;

public class Utilities {
    public static String slugify(String name){
        return new Slugify().slugify(name);
    }
}
