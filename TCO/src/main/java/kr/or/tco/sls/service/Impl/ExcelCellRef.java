package kr.or.tco.sls.service.Impl;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.util.CellReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ExcelCellRef {
	
	private static final Logger logger= 
			LoggerFactory.getLogger(ExcelCellRef.class);
	/**
     * Cell에 해당하는 Column Name을 가져온다(A,B,C..)
     * 만약 Cell이 Null이라면 int cellIndex의 값으로
     * cellNum을 가져온다.
     * @param cell
     * @param cellIndex
     * @return
     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
            logger.info("셀번호 : "+cellNum);
        }
        else {
            cellNum = cellIndex;
        }
        return CellReference.convertNumToColString(cellNum);
    }
    
    // @SuppressWarnings 경고 제외시키는 옵션 (deprecation : 사용하지 말아야 할 메소드 관련 경고 억제)
    @SuppressWarnings("deprecation")
    public static String getValue(Cell cell) {
        String value = "";
        
        //셀이 빈값일 때 null로 체크
        if(cell == null) {
            value = "";
        }
        else {
        	//타입별로 내용읽기
            if( cell.getCellType() == Cell.CELL_TYPE_FORMULA ) {
                value = cell.getCellFormula();
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_NUMERIC ) {
                value = cell.getNumericCellValue() + "";
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_STRING ) {
                value = cell.getStringCellValue();
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_BOOLEAN ) {
                value = cell.getBooleanCellValue() + "";
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_ERROR ) {
                value = cell.getErrorCellValue() + "";
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_BLANK ) {
                value = "";
            }
            else {
                value = cell.getStringCellValue();
            }
        }
        logger.info("각 셀의 내용 : "+value);
        return value;
    }
}


