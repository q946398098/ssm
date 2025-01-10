package com.martin.controller;


import com.alibaba.fastjson.JSON;
import com.martin.pojo.Books;
import com.martin.pojo.Result;
import com.martin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/queryById/{id}")
    @ResponseBody
    public String queryById(@PathVariable("id") Integer id){

        Books books = bookService.queryBookById(id);

        String jsonString = JSON.toJSONString(books);

        return jsonString;
    }

}
