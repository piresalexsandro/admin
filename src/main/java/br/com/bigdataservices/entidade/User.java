package br.com.bigdataservices.entidade;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.data.jpa.domain.AbstractPersistable;


@Entity
@Table(name = "user")
public class User extends AbstractPersistable<Long> {
    
	private static final long serialVersionUID = -7302800336276816169L;
	
	private transient Long id;
	
	@NotNull
	private String fullName;
	
	@NotNull
	private String userName;
	
	@NotNull
	private String password;
	
	private transient Long roleId;
	
	private transient Long grupoId;
	
	private int registroStatus;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;
	
	@ManyToOne
	@JoinColumn(name = "grupo_id")
	private GrupoUsuario grupo;
	
	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(final String fullName) {
		this.fullName = fullName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(final String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(final Role role) {
		this.role = role;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(final Long roleId) {
		this.roleId = roleId;
	}

	public Long getGrupoId() {
		return grupoId;
	}

	public void setGrupoId(final Long grupoId) {
		this.grupoId = grupoId;
	}

	public GrupoUsuario getGrupo() {
		return grupo;
	}

	public void setGrupo(final GrupoUsuario grupo) {
		this.grupo = grupo;
	}
	
	public int getRegistroStatus() {
        return registroStatus;
    }

    public void setRegistroStatus(int registroStatus) {
        this.registroStatus = registroStatus;
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
        final User other = (User) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
	
}
