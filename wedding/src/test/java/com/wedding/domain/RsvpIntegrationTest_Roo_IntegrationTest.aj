package com.wedding.domain;

import com.wedding.domain.RsvpDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RsvpIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RsvpIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RsvpIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private RsvpDataOnDemand RsvpIntegrationTest.dod;
    
    @Test
    public void RsvpIntegrationTest.testCountRsvps() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        long count = com.wedding.domain.Rsvp.countRsvps();
        org.junit.Assert.assertTrue("Counter for 'Rsvp' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RsvpIntegrationTest.testFindRsvp() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        java.lang.Long id = dod.getRandomRsvp().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to provide an identifier", id);
        com.wedding.domain.Rsvp obj = com.wedding.domain.Rsvp.findRsvp(id);
        org.junit.Assert.assertNotNull("Find method for 'Rsvp' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Rsvp' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void RsvpIntegrationTest.testFindAllRsvps() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        long count = com.wedding.domain.Rsvp.countRsvps();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Rsvp', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.wedding.domain.Rsvp> result = com.wedding.domain.Rsvp.findAllRsvps();
        org.junit.Assert.assertNotNull("Find all method for 'Rsvp' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Rsvp' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RsvpIntegrationTest.testFindRsvpEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        long count = com.wedding.domain.Rsvp.countRsvps();
        if (count > 20) count = 20;
        java.util.List<com.wedding.domain.Rsvp> result = com.wedding.domain.Rsvp.findRsvpEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Rsvp' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Rsvp' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void RsvpIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        java.lang.Long id = dod.getRandomRsvp().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to provide an identifier", id);
        com.wedding.domain.Rsvp obj = com.wedding.domain.Rsvp.findRsvp(id);
        org.junit.Assert.assertNotNull("Find method for 'Rsvp' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRsvp(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Rsvp' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void RsvpIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        java.lang.Long id = dod.getRandomRsvp().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to provide an identifier", id);
        com.wedding.domain.Rsvp obj = com.wedding.domain.Rsvp.findRsvp(id);
        org.junit.Assert.assertNotNull("Find method for 'Rsvp' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRsvp(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Rsvp' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void RsvpIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        com.wedding.domain.Rsvp obj = dod.getNewTransientRsvp(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Rsvp' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Rsvp' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void RsvpIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to initialize correctly", dod.getRandomRsvp());
        java.lang.Long id = dod.getRandomRsvp().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Rsvp' failed to provide an identifier", id);
        com.wedding.domain.Rsvp obj = com.wedding.domain.Rsvp.findRsvp(id);
        org.junit.Assert.assertNotNull("Find method for 'Rsvp' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'Rsvp' with identifier '" + id + "'", com.wedding.domain.Rsvp.findRsvp(id));
    }
    
}
