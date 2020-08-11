package br.com.bigdataservices.entidade;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Parametro extends AbstractPersistable<Long> {

	private static final long serialVersionUID = -2716348754532601761L;
	
	private transient Long id;
	
	@ManyToOne
    @JoinColumn(name="status_inicial")
	private Status statusInicial;
	
	public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Status getStatusInicial() {
        return statusInicial;
    }

    public void setStatusInicial(Status statusInicial) {
        this.statusInicial = statusInicial;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(final Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Parametro other = (Parametro) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
