package com.martin.service;


import com.martin.pojo.Admin;

public interface AdminService {

    Admin getByName(String username);
}
