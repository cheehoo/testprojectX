package com.wedding.domain;

import com.wedding.domain.Rsvp;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Rsvp_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Rsvp.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Rsvp.id;
    
    @Version
    @Column(name = "version")
    private Integer Rsvp.version;
    
    public Long Rsvp.getId() {
        return this.id;
    }
    
    public void Rsvp.setId(Long id) {
        this.id = id;
    }
    
    public Integer Rsvp.getVersion() {
        return this.version;
    }
    
    public void Rsvp.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Rsvp.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Rsvp.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Rsvp attached = this.entityManager.find(Rsvp.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Rsvp.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Rsvp.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Rsvp merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Rsvp.entityManager() {
        EntityManager em = new Rsvp().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Rsvp.countRsvps() {
        return (Long) entityManager().createQuery("select count(o) from Rsvp o").getSingleResult();
    }
    
    public static List<Rsvp> Rsvp.findAllRsvps() {
        return entityManager().createQuery("select o from Rsvp o").getResultList();
    }
    
    public static Rsvp Rsvp.findRsvp(Long id) {
        if (id == null) return null;
        return entityManager().find(Rsvp.class, id);
    }
    
    public static List<Rsvp> Rsvp.findRsvpEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Rsvp o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
