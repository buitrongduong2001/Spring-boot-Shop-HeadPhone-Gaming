package com.devpro.shop15.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "tbl_contact")

public class Contacts extends BaseEntity {

    @Column(name = "first_name", length = 45, nullable = false)
    private String firstName;

    @Column(name = "last_name", length = 45, nullable = false)
    private String lastName;

    @Column(name = "email", length = 45, nullable = false)
    private String email;

    @Column(name = "request_type", length = 45, nullable = false)
    private String requestType;

    @Column(name = "message", length = 1000, nullable = false)
    private String message;
}
