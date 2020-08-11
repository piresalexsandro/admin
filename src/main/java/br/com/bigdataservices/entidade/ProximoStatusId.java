package br.com.bigdataservices.entidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ProximoStatusId implements Serializable{
    
    private static final long serialVersionUID = 4674276412982307927L;

    @Column(name = "id_status", nullable = false)
    private Long statusId;
    
    @Column(name = "id_proximo_status", nullable = false)
    private Long proximoStatusId;

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public Long getProximoStatusId() {
        return proximoStatusId;
    }

    public void setProximoStatusId(Long proximoStatusId) {
        this.proximoStatusId = proximoStatusId;
    }
}