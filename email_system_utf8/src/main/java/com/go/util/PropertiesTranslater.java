package com.go.util;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-31
 * Time: 上午9:49
 * To change this template use File | Settings | File Templates.
 */
public class PropertiesTranslater{

    public static void main(String[] args){



        String result = PropertiesTranslater.GBK2Unicode("测试");

        System.out.print(result);


    }



    /**

     * 中文转unicode

     * @param str

     * @return 反回unicode编码

     */

    public static String GBK2Unicode(String str){

        StringBuffer result = new StringBuffer();

        for (int i = 0; i < str.length(); i++){

            char chr1 = (char)str.charAt(i);

            if(!PropertiesTranslater.isNeedConvert(chr1)){

                result.append(chr1);

                continue;

            }

            result.append("\\u" + Integer.toHexString((int)chr1));

        }

        return result.toString();

    }



    /**

     * unicode转中文

     * @paramstr

     * @return 中文

     */

    public static String Unicode2GBK(String dataStr) {

        int index = 0;

        StringBuffer buffer = new StringBuffer();



        while(index<dataStr.length()-2) {

            if(!"//u".equals(dataStr.substring(index,index+2))){

                buffer.append(dataStr.charAt(index));

                index++;

                continue;

            }

            String charStr = "";

            charStr = dataStr.substring(index+2,index+6);



            char letter = (char) Integer.parseInt(charStr, 16 );

            buffer.append(letter);

            index+=6;

        }

        return buffer.toString();

    }

    public static boolean isNeedConvert(char para){

        return ((para&(0x00FF))!=para);

    }

    public static String convert(String utfString){
        StringBuilder sb = new StringBuilder();
        int i = -1;
        int pos = 0;

        while((i=utfString.indexOf("\\u", pos)) != -1){
            sb.append(utfString.substring(pos, i));
            if(i+5 < utfString.length()){
                pos = i+6;
                sb.append((char)Integer.parseInt(utfString.substring(i+2, i+6), 16));
            }
        }

        return sb.toString();
    }

}


