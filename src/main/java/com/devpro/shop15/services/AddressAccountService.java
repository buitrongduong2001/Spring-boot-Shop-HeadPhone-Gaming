package com.devpro.shop15.services;

import com.devpro.shop15.entity.AddressAccount;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AddressAccountService extends BaseService<AddressAccount> {
    @Override
    protected Class<AddressAccount> clazz() {
        return AddressAccount.class;
    }

    public PagerData<AddressAccount> getListByIdUser(Integer idUser){
        String sql = "SELECT * FROM tbl_address_account a where a.id_account = "+idUser;
        return runTransactQuerySQL(sql,0,0);
    }
    public AddressAccount getByIdAndUser(Integer id, Integer idUser){
        String sql = "SELECT * FROM tbl_address_account a where a.id = "+id +" and a.id_account="+idUser;
        return getByTransactQuerySQL(sql);
    }
    @Transactional
    public AddressAccount saveAddress(AddressAccount addressAccount) throws Exception {
        List<AddressAccount> accountList = getListByIdUser(addressAccount.getUsers().getId()).getData();
        if (addressAccount.getId() == null){
            if (accountList.size() >= 4){
                throw new Exception();
            }else {
                if (addressAccount.getSetAsDefault()){
                    List<AddressAccount> addressAccountList = findAll();
                    addressAccountList.forEach(p ->{
                        if (p.getSetAsDefault()){
                            p.setSetAsDefault(false);
                            saveOrUpdate(p);
                        }
                    });
                    saveOrUpdate(addressAccount);
                }else {
                    saveOrUpdate(addressAccount);
                }
            }
        }else {
            if (addressAccount.getSetAsDefault()){
                List<AddressAccount> addressAccountList = findAll();
                addressAccountList.forEach(p ->{
                    if (p.getSetAsDefault()){
                        p.setSetAsDefault(false);
                        saveOrUpdate(p);
                    }
                });
                saveOrUpdate(addressAccount);
            }else {
                saveOrUpdate(addressAccount);
            }
        }
        return addressAccount;
    }


    @Transactional
    public AddressAccount deleteByIdAddress(Integer id) throws Exception {
        String sql = "DELETE FROM dbshop_devpro_02.tbl_address_account where id ="+id;
        String sql1 = "SELECT * FROM tbl_address_account a where a.id = "+id;
        AddressAccount addressAccount = getByTransactQuerySQL(sql1);
        addressAccount.getUsers().setRoles(null);
        Integer status = runUpdateQuerySQL(sql);
        if (status==0){
            throw new Exception();
        }
        return addressAccount;
    }
}
