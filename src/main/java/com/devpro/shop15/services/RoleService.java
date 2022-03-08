package com.devpro.shop15.services;

import com.devpro.shop15.entity.Roles;
import com.devpro.shop15.entity.Users;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleService extends BaseService<Roles> {
    @Override
    protected Class<Roles> clazz() {
        return Roles.class;
    }

    public Set<Users> getUsers(){
        List<Roles> roles = findAll();
        Set<Users> listUser = new HashSet<>();
        for (Roles s:roles) {
            if (s.getId() == 2){
                listUser = s.getUsers();
            }
        }
        return listUser;
    }
}
