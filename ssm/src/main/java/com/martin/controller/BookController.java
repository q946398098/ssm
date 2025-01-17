package com.martin.controller;


import com.martin.pojo.Books;
import com.martin.pojo.dto.BorrowBookDto;
import com.martin.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/borrow")
    public String borrow(Model model){
       List<Books> b_list = bookService.queryAllBook();
       System.out.println("---------------");
       System.out.println(b_list);
       model.addAttribute("books",b_list);
       return "borrow";
    }

    @PostMapping("/borrowBook")
    public String borrowBook(BorrowBookDto borrowBookDto,Model model){
        bookService.rentBook(borrowBookDto.getBookId());
        return "redirect:/book/borrow";
    }


}
