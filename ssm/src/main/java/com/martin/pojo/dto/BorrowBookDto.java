package com.martin.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BorrowBookDto {
    private int bookID;
    private String bookName;
    private String borrowerName;
    private String borrowerPhone;
}