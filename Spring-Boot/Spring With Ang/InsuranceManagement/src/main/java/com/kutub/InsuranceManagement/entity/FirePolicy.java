package com.kutub.InsuranceManagement.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "firepolicies")
public class FirePolicy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String date;

    @Column(nullable = false)
    private String bankName;

    @Column(nullable = false)
    private String policyholder;

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private String stockInsured;

    @Column(nullable = false)
    private double sumInsured;

    @Column(nullable = false)
    private String interestInsured;

    @Column(nullable = false)
    private String coverage;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private String construction;

    @Column(nullable = false)
    private String owner;

    @Column(nullable = false)
    private String usedAs;

    @Column(nullable = false)
    private String periodFrom;

    @Column(nullable = false)
    private String periodTo;



//    @JsonIgnore
//    @OneToMany(mappedBy = "firePolicy", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<FireBill> fireBills;


}
