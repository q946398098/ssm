package com.martin.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BorrowBookDto {
    private int bookId;
    private String borrowerName;
    private String borrowerPhone;
}
