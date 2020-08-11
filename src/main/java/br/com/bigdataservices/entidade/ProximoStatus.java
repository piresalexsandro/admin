package br.com.bigdataservices.entidade;


import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class ProximoStatus extends AbstractPersistable<ProximoStatusId> {

    private static final long serialVersionUID = -2716348754532601761L;

    @EmbeddedId
    private ProximoStatusId id;

    @ManyToOne
    @JoinColumn(name = "id_status", nullable = false, insertable = false, updatable = false)
    private Status status;
    
    @ManyToOne
    @JoinColumn(name = "id_proximo_status", nullable = false, insertable = false, updatable = false)
    private Status proximoStatus;

    public ProximoStatusId getId() {
        return id;
    }

    public void setId(ProximoStatusId id) {
        this.id = id;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Status getProximoStatus() {
        return proximoStatus;
    }

    public void setProximoStatus(Status proximoStatus) {
        this.proximoStatus = proximoStatus;
    }
    
}
