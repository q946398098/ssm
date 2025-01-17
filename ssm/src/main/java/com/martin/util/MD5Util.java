package com.martin.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

    /**
     * 生成MD5哈希值
     *
     * @param input 输入字符串
     * @return MD5哈希值
     */
    public static String md5(String input) {
        try {
            // 获取MD5消息摘要实例
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算输入字符串的MD5哈希值
            byte[] messageDigest = md.digest(input.getBytes());
            // 将字节数组转换为十六进制字符串
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }



}