package com.devpro.shop15.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "tbl_users")
public class Users extends BaseEntity implements UserDetails {

    @Column(name = "username", length = 45, nullable = false)
    private String username;

    @Column(name = "password", length = 100, nullable = false)
    private String password;

    @Column(name = "email", length = 45, nullable = false)
    private String email;

    @Column(name = "img_user", nullable = false)
    private String imgUser;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "phone")
    private String phone;

    @Column(name = "birth_date")
    private Date birthDate;

    @Column(name = "sex")
    private Boolean sex;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "users")
    private Set<Roles> roles = new HashSet<>();

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "users")
    private Set<SaleOrders> saleOrders = new HashSet<>();

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
    private Set<AddressAccount> addressAccounts = new HashSet<>();

    public Set<AddressAccount> getAddressAccounts() {
        return addressAccounts;
    }

    public void setAddressAccounts(Set<AddressAccount> addressAccounts) {
        this.addressAccounts = addressAccounts;
    }

    public void addSaleOrders(SaleOrders saleOrders){
        this.saleOrders.add(saleOrders);
        saleOrders.setUsers(this);
    }
    public void deleteSaleOrders(SaleOrders saleOrders){
        this.saleOrders.remove(saleOrders);
        saleOrders.setUsers(null);
    }


    public void addRoles(Roles role){
        role.getUsers().add(this);
        this.roles.add(role);
    }
    public void deleteRoles(Roles roles){
        roles.getUsers().remove(this);
        this.roles.remove(roles);
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Roles> getRoles() {
        return roles;
    }

    public void setRoles(Set<Roles> roles) {
        this.roles = roles;
    }

    public Set<SaleOrders> getSaleOrders() {
        return saleOrders;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImgUser() {
        return imgUser;
    }

    public void setImgUser(String imgUser) {
        this.imgUser = imgUser;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setSaleOrders(Set<SaleOrders> saleOrders) {
        this.saleOrders = saleOrders;
    }

    //Security thong tin User
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.roles;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
