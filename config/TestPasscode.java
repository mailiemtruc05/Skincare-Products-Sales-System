package edu.uth.wed_san_pham_cham_soc_da.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class TestPasscode {
    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("3456"));
    }
}
