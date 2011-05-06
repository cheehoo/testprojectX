package com.wedding.domain;

import java.lang.Integer;
import java.lang.String;
import java.util.Date;

privileged aspect Rsvp_Roo_JavaBean {
    
    public String Rsvp.getCode() {
        return this.code;
    }
    
    public void Rsvp.setCode(String code) {
        this.code = code;
    }
    
    public String Rsvp.getEmail() {
        return this.email;
    }
    
    public void Rsvp.setEmail(String email) {
        this.email = email;
    }
    
    public Integer Rsvp.getAttending() {
        return this.attending;
    }
    
    public void Rsvp.setAttending(Integer attending) {
        this.attending = attending;
    }
    
    public String Rsvp.getSpecialRequests() {
        return this.specialRequests;
    }
    
    public void Rsvp.setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }
    
    public Date Rsvp.getConfirmed() {
        return this.confirmed;
    }
    
    public void Rsvp.setConfirmed(Date confirmed) {
        this.confirmed = confirmed;
    }
    
}
