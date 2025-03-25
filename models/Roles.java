package edu.uth.wed_san_pham_cham_soc_da.models;
import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "roles")
public class Roles {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uID", nullable = false)
    private Integer id;
    @Column(name = "name", nullable = false)
    private String name;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Roles() {

    }

    public Roles(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Roles(Integer id, String name, Set<AccountRole> rolesaccount) {
        this.id = id;
        this.name = name;
        Rolesaccount = rolesaccount;
    }

    @OneToMany(mappedBy = "role")
    private Set<AccountRole> Rolesaccount;
}
