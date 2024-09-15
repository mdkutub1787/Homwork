package com.kutub.InsuranceManagement.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Policy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String date;
    private String bankName;
    private String policyholder;
    private String address;
    private String stockInsured;
    private double sumInsured;
    private String interestInsured;
    private String coverage;
    private String location;
    private String construction;
    private String owner;
    private String usedAs;
    private String periodFrom;
    private String periodTo;


    public Policy(int id) {
        this.id = id;
    }

}
