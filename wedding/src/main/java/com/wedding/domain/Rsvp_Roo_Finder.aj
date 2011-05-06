package com.wedding.domain;

import java.lang.String;
import java.lang.SuppressWarnings;
import javax.persistence.EntityManager;
import javax.persistence.Query;

privileged aspect Rsvp_Roo_Finder {
    
    @SuppressWarnings("unchecked")
    public static Query Rsvp.findRsvpsByCodeEquals(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = Rsvp.entityManager();
        Query q = em.createQuery("SELECT Rsvp FROM Rsvp AS rsvp WHERE rsvp.code = :code");
        q.setParameter("code", code);
        return q;
    }
    
}
