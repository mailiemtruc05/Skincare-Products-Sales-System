package edu.uth.wed_san_pham_cham_soc_da.repository;

import edu.uth.wed_san_pham_cham_soc_da.models.Roles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Roles, Integer> {
    Roles findByName(String name);
}
