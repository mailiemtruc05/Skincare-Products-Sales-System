package edu.uth.wed_san_pham_cham_soc_da.models;

import jakarta.persistence.*;
import org.hibernate.annotations.Nationalized;

@Entity
public class SubCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sub_id", nullable = false)
    private Integer id;

    @Nationalized
    @Column(name = "subname", nullable = false, length = 50)
    private String subname;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "cid", nullable = false)
    private Category cid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

}