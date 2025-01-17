package com.martin.pojo.dto;

import lombok.Data;

@Data
public class BorrowBookDto {
    private int bookId;
    private String borrowerName;
    private String borrowerPhone;

}
