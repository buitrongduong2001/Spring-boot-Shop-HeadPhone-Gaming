package com.devpro.shop15.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "tbl_roles")
public class Roles extends  BaseEntity implements GrantedAuthority {

    @Column(name = "name", length = 45, nullable = false)
    private String name;

    @Column(name = "description", length = 45, nullable = false)
    private String description;

    @JsonBackReference
    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    //Định nghĩa bảng trung gian vừa là khóa chính vừa là khóa phụ
    @JoinTable(name = "tbl_users_roles",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Set<Users> users= new HashSet<>();

    public void addUsers(Users user){
        user.getRoles().add(this);
        users.add(user);
    }
    public void removeUser(Users user){
        user.getRoles().remove(this);
        users.remove(user);
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Users> getUsers() {
        return users;
    }

    public void setUsers(Set<Users> users) {
        this.users = users;
    }

    //Securty Lấy ra name của role
    @Override
    public String getAuthority() {
        return this.name;
    }
}
