package com.devpro.shop15.services;

import com.devpro.shop15.entity.Contacts;
import org.springframework.stereotype.Service;

@Service
public class ContactService extends BaseService<Contacts> {

    @Override
    protected Class<Contacts> clazz() {
        return Contacts.class;
    }
}
