package edu.uth.wed_san_pham_cham_soc_da.models;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;
import java.util.Set;

@Entity
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uID", nullable = false)
    private Integer id;

    @Column(name = "username", nullable = false,columnDefinition = "NVARCHAR(255)")
    private String username;

    @Column(name = "password", nullable = false,columnDefinition = "NVARCHAR(255)")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "phone", length = 15)
    private String phone;

    @ColumnDefault("0")
    @Column(name = "isSeller")
    private Boolean isSeller;

    @ColumnDefault("0")
    @Column(name = "isAdmin")
    private Boolean isAdmin;

    @ColumnDefault("getdate()")
    @Column(name = "createdAt")
    private Instant createdAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getIsSeller() {
        return isSeller;
    }

    public void setIsSeller(Boolean isSeller) {
        this.isSeller = isSeller;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

        @OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
        private Set<AccountRole> accountRoles;

        public Account() {}

        public Account(Integer id, String username, String password, String email, String phone, Boolean isSeller, Boolean isAdmin, Instant createdAt) {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
            this.phone = phone;
            this.isSeller = isSeller;
            this.isAdmin = isAdmin;
            this.createdAt = createdAt;
        }
        public Set<AccountRole> getAccountRoles() { return accountRoles; }
        public void setAccountRoles(Set<AccountRole> accountRoles) { this.accountRoles = accountRoles; }
    }
