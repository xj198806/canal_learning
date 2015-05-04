package com.go.util;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-30
 * Time: 下午1:08
 * To change this template use File | Settings | File Templates.
 */
public class ExcelUtils {
    // 对外提供读取excel文件的接口
    public static List<List<Object>> readExcel(File file) throws IOException {
        String fName = file.getName();
        String extension = fName.lastIndexOf(".") == -1 ? "" : fName
                .substring(fName.lastIndexOf(".") + 1);
        if ("xls".equals(extension)) {// 2003
            return read2003Excel(file);
        } else if ("xlsx".equals(extension)) {// 2007
            return read2007Excel(file);
        } else {
            throw new IOException("不支持的文件类型:" + extension);
        }
    }

    /**
     * 读取2003excel
     *
     * @param file
     * @return
     */
    private static List<List<Object>> read2003Excel(File file)
            throws IOException {
        List<List<Object>> dataList = new ArrayList<List<Object>>();
        HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFRow row = null;
        HSSFCell cell = null;
        Object val = null;
        DecimalFormat df = new DecimalFormat("0");// 格式化数字
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 格式化日期字符串
        for (int i = sheet.getFirstRowNum(); i < sheet
                .getPhysicalNumberOfRows(); i++) {
            row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            List<Object> objList = new ArrayList<Object>();
            for (short j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
                cell = row.getCell(j);
                if (cell == null) {
                    val = null;
                    objList.add(val);
                    continue;
                }
                switch (cell.getCellType()) {
                    case HSSFCell.CELL_TYPE_STRING:
                        val = cell.getStringCellValue();
                        break;
                    case HSSFCell.CELL_TYPE_NUMERIC:
                        if (HSSFDateUtil.isCellDateFormatted(cell)) {
                            Date date = cell.getDateCellValue();
                            if (date != null) {
                                val = sdf.format(date);
                            } else {
                                val = "";
                            }
                        } else {
                            val = df.format(cell
                                    .getNumericCellValue());
                        }
                        break;
                    case HSSFCell.CELL_TYPE_BOOLEAN:
                        val = cell.getBooleanCellValue();
                        break;
                    case HSSFCell.CELL_TYPE_BLANK:
                        val = "";
                        break;
                    default:
                        val = cell.toString();
                        break;
                }
                objList.add(val);
            }
            dataList.add(objList);
        }
        return dataList;
    }

    /**
     * 读取excel表头
     *
     * @param file
     * @return
     * @throws IOException
     */
    public static String[] readExcelHead(File file) throws IOException {
        HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFRow row = null;
        HSSFCell cell = null;
        row = sheet.getRow(0);
        String[] buff = new String[row.getLastCellNum()];
        for (short i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {
            cell = row.getCell(i);
            buff[i] = cell.getStringCellValue();
        }
        return buff;
    }

    /**
     * 读取2007excel
     *
     * @param file
     * @return
     */

    private static List<List<Object>> read2007Excel(File file)
            throws IOException {
        List<List<Object>> dataList = new ArrayList<List<Object>>();
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(file));
        XSSFSheet sheet = xwb.getSheetAt(0);
        XSSFRow row = null;
        XSSFCell cell = null;
        Object val = null;
        DecimalFormat df = new DecimalFormat("0");// 格式化数字
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 格式化日期字符串
        for (int i = sheet.getFirstRowNum(); i < sheet
                .getPhysicalNumberOfRows(); i++) {
            row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            List<Object> objList = new ArrayList<Object>();
            for (int j = row.getFirstCellNum(); j < row.getLastCellNum(); j++) {
                cell = row.getCell(j);
                if (cell == null) {
                    val = null;
                    objList.add(val);
                    continue;
                }
                switch (cell.getCellType()) {
                    case XSSFCell.CELL_TYPE_STRING:
                        val = cell.getStringCellValue();
                        break;
                    case XSSFCell.CELL_TYPE_NUMERIC:
                        if ("@".equals(cell.getCellStyle().getDataFormatString())) {
                            val = df.format(cell.getNumericCellValue());
                        } else if ("General".equals(cell.getCellStyle()
                                .getDataFormatString())) {
                            val = df.format(cell.getNumericCellValue());
                        } else {
                            val = sdf.format(HSSFDateUtil.getJavaDate(cell
                                    .getNumericCellValue()));
                        }
                        break;
                    case XSSFCell.CELL_TYPE_BOOLEAN:
                        val = cell.getBooleanCellValue();
                        break;
                    case XSSFCell.CELL_TYPE_BLANK:
                        val = "";
                        break;
                    default:
                        val = cell.toString();
                        break;
                }
                objList.add(val);
            }
            dataList.add(objList);
        }
        return dataList;
    }
}
