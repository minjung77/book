package com.user.model;

import java.util.Date;

public class OrderDTO {
    private int orderId;           // 주문 고유번호
    private String userId;         // 사용자 아이디
    private Date orderDate;        // 주문 날짜
    private int totalAmount;       // 총 주문 금액
    private int orderStatusId;     // 주문 상태 ID
    private int deliveryId;        // 배송 상태 ID
    private int orderPayStatus;    // 예치금 차감 상태
    
    // Getter and Setter methods
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getOrderPayStatus() {
        return orderPayStatus;
    }

    public void setOrderPayStatus(int orderPayStatus) {
        this.orderPayStatus = orderPayStatus;
    }
}
