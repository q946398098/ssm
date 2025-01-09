package com.martin.controller;


import com.alibaba.fastjson.JSON;
import com.martin.pojo.Books;
import com.martin.pojo.Result;
import com.martin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/list")
    @ResponseBody
    public String list(){

        Books books = bookService.queryBookById(1);

        String jsonString = JSON.toJSONString(books);

        return jsonString;
    }

}
