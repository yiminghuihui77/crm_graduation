package com.cjlu.conversion;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * String --> Date类型转换器
 * @author minghui.y
 * @create 2018-02-22 21:19
 **/
public class DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String dateStr) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
           return dateFormat.parse(dateStr);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
