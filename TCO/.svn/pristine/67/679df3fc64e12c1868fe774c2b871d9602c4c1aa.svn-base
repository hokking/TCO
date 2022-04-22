package kr.or.tco.att.service.impl;

import java.util.List;
import java.util.Map;

import kr.or.tco.att.vo.WorksttsVO;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.emp.vo.EmpVO;

public interface AttService {
	// 로그인한 유저의 기본정보 select
	public EmpVO binfoselect(String empId) ;
	
	// 로그인한 유저의 공통코드에 따른 부서/직급
	public CmncdVO sdselect(String cmncdCd);
	
	// 로그인한 유저의 공통코드에 따른 근태상태
	public String sdselect2(String cmncdCd);
		
	// 출퇴근시간 확인용
	public int checkIselect(String empId);
	public int checkOselect(String empId);
		
	
	// 출근
	public int ininsert(WorksttsVO worksttsVO);
	
	// 퇴근
	public int outinsert(String empId);
	
	// 출퇴근 시간 계산
	public int enbgselect(String empId);
		
	// 지정 근무시간 계산
	public int CKenbgselect(String empId);
		
	
	// 지정 출근
	public int stck(String empId);
	// 지정 퇴근
	public int endck(String empId);
	
	// 근무시간 update
	public int enbgupdate(WorksttsVO worksttsVO);
	
	
	// 출근(시간)
	public int st(String empId);
	
	// 출근(분)
	public int stm(String empId);
	
	// 퇴근(시간)
	public int end(String empId);
	
	// 업무상태 update
	public int cdupdate(WorksttsVO worksttsVO);
	

	// 임시테이블에 insert
	public int teminsert();
	
	// 크로스조인값 insert
	public int reinsert();
	
	// 근무시간 update
	public int reupdate();
		
	// 이번달 근무시간
	public int sumtm(Map<String, Object> map);
	
	// 이번달 근무시간 DETAIL
	public int sumtm2(String empId);
		
	// 출근시간
	public String gotime(String empId);
		
	// 퇴근시간
	public String outtime(String empId);
	
	// 이번주구하기
	public List<WorksttsVO> thisweek(String empId);
	
	// 모든이의 이번주 구하기
	public List<WorksttsVO> thisweekall(int cal);
	
	// 업무상태 update
	public int workck(WorksttsVO worksttsVO);
		
	
	// 업무상태 LIST
	public List<EmpVO> attchecklist();
	
}
