package com.go.util;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 13-10-31
 * Time: 下午2:55
 * To change this template use File | Settings | File Templates.
 */

public class StringGenerator{

    public static synchronized String getUniqueString()

    {

        if(generateCount > MAX_GENERATE_COUNT)

            generateCount = 0;

        String uniqueNumber = Long.toString(System.currentTimeMillis()) + Integer.toString(generateCount);

        generateCount++;

        return uniqueNumber;

    }



    private static final int MAX_GENERATE_COUNT = 99999;

    private static int generateCount = 0;



}