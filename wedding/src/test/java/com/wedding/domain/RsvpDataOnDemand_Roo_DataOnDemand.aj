package com.wedding.domain;

import com.wedding.domain.Rsvp;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RsvpDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RsvpDataOnDemand: @Component;
    
    private Random RsvpDataOnDemand.rnd = new SecureRandom();
    
    private List<Rsvp> RsvpDataOnDemand.data;
    
    public Rsvp RsvpDataOnDemand.getNewTransientRsvp(int index) {
        com.wedding.domain.Rsvp obj = new com.wedding.domain.Rsvp();
        obj.setAttending(new Integer(index));
        obj.setCode("code_" + index);
        return obj;
    }
    
    public Rsvp RsvpDataOnDemand.getSpecificRsvp(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Rsvp obj = data.get(index);
        return Rsvp.findRsvp(obj.getId());
    }
    
    public Rsvp RsvpDataOnDemand.getRandomRsvp() {
        init();
        Rsvp obj = data.get(rnd.nextInt(data.size()));
        return Rsvp.findRsvp(obj.getId());
    }
    
    public boolean RsvpDataOnDemand.modifyRsvp(Rsvp obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void RsvpDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.wedding.domain.Rsvp.findRsvpEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Rsvp' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.wedding.domain.Rsvp>();
        for (int i = 0; i < 10; i++) {
            com.wedding.domain.Rsvp obj = getNewTransientRsvp(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
