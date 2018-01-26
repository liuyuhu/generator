package com.generator.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @author liuyuhu
 * @date 2018/1/25  10:50
 */
public class IDUtils {

    /**
     * uuid生成
     * @return 生成32位uuid
     */
    public static String UUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 图片名生成
     */
    public static String genImageName() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //加上三位随机数
        Random random = new Random();
        int end3 = random.nextInt(999);
        //如果不足三位前面补0
        return millis + String.format("%03d", end3);
    }

    /**
     * 商品id生成
     */
    public static long genItemId() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //加上两位随机数
        Random random = new Random();
        int end2 = random.nextInt(99);
        //如果不足两位前面补0
        String str = millis + String.format("%02d", end2);
        return new Long(str);
    }

    /**
     * 订单id生成
     */
    public static String genOrderId() {
        //取当前时间的长整形值包含毫秒
        String millis = System.currentTimeMillis() + "";
        millis = millis.substring(5, millis.length());
        //加上四位随机数
        Random random = new Random();
        int end4 = random.nextInt(9999);
        //如果不足两位前面补0
        String str = String.format("%04d", end4);
        return millis + str;
    }
    /**
     * 订单项id生成
     */
    public static String genOrderItemId() {
        //取当前时间的长整形值包含毫秒
        String millis = System.currentTimeMillis() + "";
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        String data = format.format(new Date());
        millis = millis.substring(7, millis.length());
        //加上四位随机数
        Random random = new Random();
        int end4 = random.nextInt(9999);
        //如果不足两位前面补0
        String str = String.format("%04d", end4);
        return data + millis + str;
    }
}
