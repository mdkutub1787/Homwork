package com.kutub.InsuranceManagement.service;

import com.kutub.InsuranceManagement.repository.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TokenService {

    @Autowired
    private TokenRepository tokenRepository;
}
