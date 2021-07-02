package com.ssm.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Description: MD5加密工具类
 * @Author: ONESTAR
 * @Date: Created in 10:34 2020/3/27
 * @QQ群: 530311074
 * @URL: https://onestar.newstar.net.cn/
 */
public class MD5Utils {
    public static String code(String str){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte[]byteDigest = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < byteDigest.length; offset++) {
                i = byteDigest[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            //32位加密
            return buf.toString();
            // 16位的加密
            //return buf.toString().substring(8, 24);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }

    }

    
    /**
     * 加密解密算法 执行一次加密，两次解密
     */
    public static String convertMD5(String inStr){
 
        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;
 
    }

    
    

    // 测试主函数
    public static void main(String args[]) {
        String s = new String("1233");
        System.out.println("原始：" + s);
        System.out.println("MD5后：" + code(s));
        System.out.println("加密的：" + convertMD5(s));
        System.out.println("解密的：" + convertMD5(convertMD5(s)));
        System.out.println("MD5后：" + code(code(s)));
 
    }

}