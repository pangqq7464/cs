package edu.pry.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageBean {
    public static void backMap(Map<String , Object> map,int pages,int record,HttpServletRequest request,Object clazz){
        String name = clazz.getClass().getSimpleName().toLowerCase();
        map.put(name , clazz);
        map.put("startNum" , (pages-1)*record);
        map.put("record" , record);
        map.put("pages" , pages);
        map.put("url" , request.getServletPath().substring(1));
    }
    public static void bfMap(Map<String , Object> map,int count,List<?> list,Class<?> clazz){
        String name = clazz.getSimpleName().toLowerCase();
        map.put(name+"List" , list);
        int record = Integer.parseInt(map.get("record").toString());
        int sumPage = (count%record==0)?(count/record):(count/record+1);
        map.put("sumPage" , sumPage);
        map.put("count" , count);
    }
}
