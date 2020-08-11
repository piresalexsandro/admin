package br.com.bigdataservices.entidade;

import javax.persistence.*;

import org.springframework.data.jpa.domain.AbstractPersistable;

import java.sql.Timestamp;

/**
 * The persistent class for the anexo database table.
 * 
 */
@Entity
@Table(name = "anexo")
public class Anexo extends AbstractPersistable<Long> {

    private static final long serialVersionUID = -8941355892645277499L;

    private transient Long id;

    @Column(name = "data_envio")
    private Timestamp dataEnvio;

    @Column(name = "enviado_por")
    private String enviadoPor;

    @Column(name = "nome_arquivo")
    private String nomeArquivo;

    private String url;

    private String idS3;

    // bi-directional many-to-one association to Solicitacao
    @ManyToOne
    @JoinColumn(name = "id_solicitacao")
    private Solicitacao solicitacao;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getDataEnvio() {
        return this.dataEnvio;
    }

    public void setDataEnvio(Timestamp dataEnvio) {
        this.dataEnvio = dataEnvio;
    }

    public String getEnviadoPor() {
        return this.enviadoPor;
    }

    public void setEnviadoPor(String enviadoPor) {
        this.enviadoPor = enviadoPor;
    }

    public String getNomeArquivo() {
        return this.nomeArquivo;
    }

    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIdS3() {
        return idS3;
    }

    public void setIdS3(String idS3) {
        this.idS3 = idS3;
    }

    public Solicitacao getSolicitacao() {
        return this.solicitacao;
    }

    public void setSolicitacao(Solicitacao solicitacao) {
        this.solicitacao = solicitacao;
    }
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Anexo other = (Anexo) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
