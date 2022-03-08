package com.devpro.shop15.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrders extends BaseEntity {

    @Column(name = "code", length = 45, nullable = false)
    private String codeOrder;


    @Column(name = "total",scale = 13, precision = 2,nullable = true)
    private BigDecimal total;

    @Column(name = "customer_name", length = 100, nullable = true)
    private String customerName;

    @Column(name = "customer_address", length = 100, nullable = true)
    private String customerAddress;

    @Column(name = "seo", length = 200, nullable = true)
    private String seo;

    @Column(name = "customer_phone", length = 100, nullable = true)
    private String customerPhone;

    @Column(name = "customer_email", length = 100, nullable = true)
    private String customerEmail;

    @Column(name = "status_order")
    private Integer statusOrder;

    @Column(name = "status_payment")
    private Integer statusPayment;

    @Column(name = "payments")
    private Integer payments;

    @Column(name = "finish_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date finishDate;

    @Lob
    @Column(name = "note")
    private String note;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private Users users;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "saleOrders")
    private Set<SaleOrderProducts> saleOrderProducts = new HashSet<>();

    public void addSaleOrderProduct(SaleOrderProducts saleOrderProducts){
        this.saleOrderProducts.add(saleOrderProducts);
        saleOrderProducts.setSaleOrders(this);
    }

    public void deleteSaleOrderProduct(SaleOrderProducts saleOrderProducts){
        this.saleOrderProducts.remove(saleOrderProducts);
        saleOrderProducts.setSaleOrders(null);
    }


    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Integer getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(Integer statusOrder) {
        this.statusOrder = statusOrder;
    }

    public Integer getStatusPayment() {
        return statusPayment;
    }

    public void setStatusPayment(Integer statusPayment) {
        this.statusPayment = statusPayment;
    }

    public Integer getPayments() {
        return payments;
    }

    public void setPayments(Integer payments) {
        this.payments = payments;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Set<SaleOrderProducts> getSaleOrderProducts() {
        return saleOrderProducts;
    }

    public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
        this.saleOrderProducts = saleOrderProducts;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }
}

