package com.user.model;

import java.util.Date;

public class DeliveryDTO {
    private int deliveryId;        // 배송 고유 번호
    private int orderId;           // 주문 번호
    private String userId;         // 사용자 아이디
    private String address1;       // 기본 배송지
    private String address2;       // 추가 배송지
    private Date deliveryStart;    // 배송 시작일
   

    // Getter and Setter methods
    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

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

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public Date getDeliveryStart() {
        return deliveryStart;
    }

    public void setDeliveryStart(Date deliveryStart) {
        this.deliveryStart = deliveryStart;
    }

   
}
