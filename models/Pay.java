package edu.uth.wed_san_pham_cham_soc_da.models;

import jakarta.persistence.*;
import org.hibernate.annotations.Nationalized;

@Entity
public class Pay {
    @Id
    @Column(name = "MaKH", nullable = false, length = 6)
    private String maKH;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "UserID", nullable = false)
    private edu.uth.wed_san_pham_cham_soc_da.models.Account userID;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ProductID", nullable = false) // Liên kết với Product
    private Product product;

    @Nationalized
    @Column(name = "TenKhachHang", nullable = false, length = 50)
    private String tenKhachHang;

    @Column(name = "SoDienThoai", nullable = false, length = 15)
    private String soDienThoai;

    @Column(name = "Email", nullable = false, length = 50)
    private String email;

    @Nationalized
    @Column(name = "PTTT", nullable = false, length = 50)
    private String pttt;

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public edu.uth.wed_san_pham_cham_soc_da.models.Account getUserID() {
        return userID;
    }

    public void setUserID(edu.uth.wed_san_pham_cham_soc_da.models.Account userID) {
        this.userID = userID;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPttt() {
        return pttt;
    }

    public void setPttt(String pttt) {
        this.pttt = pttt;
    }

}