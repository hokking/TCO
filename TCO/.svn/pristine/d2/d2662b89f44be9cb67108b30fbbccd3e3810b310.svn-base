package kr.or.tco.util.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.tco.util.mapper.CalendarMapper;
import kr.or.tco.util.service.CalendarService;
import kr.or.tco.util.vo.CalendarVO;

@Service
public class CalendarServiceimpl implements CalendarService{
	
	@Autowired
	CalendarMapper calendarMapper;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CalendarServiceimpl.class);
	
	
	
	@Override
	public List<CalendarVO> schedulelist(String userId) {
		List<CalendarVO>list = this.calendarMapper.schedulelist(userId);
		logger.info("일정목록: "+list);
		return list;
	}


	@Override
	public int insertschedule(CalendarVO calendarVO) {
		int result = this.calendarMapper.insertschedule(calendarVO);
		logger.info("등록결과: "+result);
		return result;
	}


	@Override
	public int updateschedule(CalendarVO calendarVO) {
		int result = this.calendarMapper.updateschedule(calendarVO);
		logger.info("수정결과: "+result);
		return result;
	}


	@Override
	public int deleteschedule(int calendarNo) {
		int result = this.calendarMapper.deleteschedule(calendarNo);
		logger.info("삭제결과: "+result);
		return result;
	}


	@Override
	public List<CalendarVO> mainschelist() {
		List<CalendarVO>list =this.calendarMapper.mainschelist();
		return list;
	}


	@Override
	public int mainInsertSch(CalendarVO calendarVO) {
		
		return this.calendarMapper.mainInsertSch(calendarVO);
	}


	@Override
	public int mainUpdateSch(CalendarVO calendarVO) {
		
		return this.calendarMapper.mainUpdateSch(calendarVO);
	}


	@Override
	public int mainDeleteSch(int mainCalno) {
		
		return this.calendarMapper.mainDeleteSch(mainCalno);
	}

}
