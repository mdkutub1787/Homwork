package com.kutub.InsuranceManagement.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private double fire;

    @Column(nullable = false)
    private double rsd;

    @Column(nullable = false)
    private double netPremium;

    @Column(nullable = false)
    private double tax;

    @Column(nullable = false)
    private double grossPremium;

    // Many Bills can belong to one Policy
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "policy_id", nullable = false)  // Foreign key for Policy entity
    private Policy policy;

    public Bill(int id) {
        this.id = id;
    }
}
