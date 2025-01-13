package com.martin.service.impl;

import com.martin.dao.AdminMapper;
import com.martin.pojo.Admin;
import com.martin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin getByName(String username) {
       return  adminMapper.getByName(username);
    }
}
