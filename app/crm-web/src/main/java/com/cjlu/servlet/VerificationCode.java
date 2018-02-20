package com.cjlu.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * 验证码Servlet
 * @author minghui.y
 * @create 2018-02-20 11:20
 **/
public class VerificationCode extends HttpServlet{
    /**随机字典*/
    public static final char [] CHARS = {'2','3','4','5','6','7','8','9','0',
            'a','b','c','d','e','f','g','h','j','k','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A','B','C','D','E','F','G','H','G','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};

    /**定义随机数*/
    public static Random random = new Random();

    /**获得随机数*/
    public static String getRandomString(){
        StringBuffer buffer = new StringBuffer();
        for(int i=0;i<4;i++){
            buffer.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return buffer.toString();
    }
    /**获得随机的颜色*/
    public static Color getRandomColor(){
        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    }

    /**获得反色*/
    public static Color getReverColor(Color c){
        return new Color(255-c.getRed(), 255-c.getGreen(), 255-c.getBlue());
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        //设置输出类型
        response.setContentType("image/jpg");

        //获得随机的字符串
        String randomString  = getRandomString();
        //获得背景色
        Color color = getRandomColor();
        //获得文字颜色
        Color revColor = getReverColor(color);

        //创建图片
        BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_RGB);
        //画笔
        Graphics g = bi.getGraphics();
        //设置画笔的颜色
        g.setColor(color);
        g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 28));
        //设置背景
        g.fillRect(0, 0, 100, 40);

        //改变画笔的颜色,设置文字
        g.setColor(revColor);
        g.drawString(randomString, 12, 29);

        //添加噪点
        for(int i =0; i< 100;i++){
            g.drawRect(random.nextInt(100), random.nextInt(40), 1, 1);
        }

        //将字符串放入session
        request.getSession().setAttribute("yzm", randomString);

        //把图片写出
        ImageIO.write(bi, "jpg", response.getOutputStream());


    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doGet(request, response);
    }


}
