package com.kutub.InsuranceManagement.repository;

import com.kutub.InsuranceManagement.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository

public interface BillRepository extends JpaRepository<Bill, Integer> {

    // Adjusted query assuming Bill has a reference to FirePolicy entity via `policy`.
    @Query("SELECT fb FROM Bill fb WHERE fb.policy.policyholder = :policyholder")
    List<Bill> findFireBillsByPolicyholder(@Param("policyholder") String policyholder);



}
