package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.Account;

public interface AccountService {
    Account findByUsername(String username);
    Account findByEmail(String email);
}
