package edu.uth.wed_san_pham_cham_soc_da.repository;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByUsername(String username);
    Account findByEmail(String email);
}
