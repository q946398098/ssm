package com.martin.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class Result<T> {
    private Integer code;
    private String msg;
    private T data;

    //第一个T表名这是一个泛型方法，
    public static <T> Result<T> success(T data) {
        return new Result<>(0, "success", data);
    }
    public static <T> Result<T> success() {
        return new Result(0, "success",null);
    }
    public static <T> Result<T> error(String msg) {
        return new Result<>(1, msg, null);
    }


}
