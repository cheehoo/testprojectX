package com.wedding.domain;

import java.lang.String;

privileged aspect Rsvp_Roo_ToString {
    
    public String Rsvp.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Code: ").append(getCode()).append(", ");
        sb.append("Email: ").append(getEmail()).append(", ");
        sb.append("Attending: ").append(getAttending()).append(", ");
        sb.append("SpecialRequests: ").append(getSpecialRequests()).append(", ");
        sb.append("Confirmed: ").append(getConfirmed());
        return sb.toString();
    }
    
}
