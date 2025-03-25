package edu.uth.wed_san_pham_cham_soc_da.Service;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import edu.uth.wed_san_pham_cham_soc_da.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceiml implements AccountService {
    @Autowired
    private AccountRepository aRepo;
    @Override
    public Account findByUsername(String username) {
        return aRepo.findByUsername(username);
    }

    @Override
    public Account findByEmail(String email) {
        return aRepo.findByEmail(email);
    }
}
