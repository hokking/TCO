package kr.or.tco.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.tco.emp.vo.EmpAuth;
import kr.or.tco.emp.vo.EmpVO;

public class CustomUser extends User {

	private EmpVO emp;
	
	public CustomUser(String username, String password
			, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	//return member==null?null:new CustomUser(member);
	//사용자가 정의한 MemberVO 타입을 
	//스프링 시큐리티 UsersDetails 타입으로 변환
	public CustomUser(EmpVO emp) {
		//super(username, password, authorities);
//		super(member.getMemberid(), member.getPassword(),
//				member.getAuthList().stream()
//				.map(auth->new SimpleGrantedAuthority(
//						auth.getAuth())).collect(Collectors.toList()));
		super(emp.getEmpId(), emp.getEmpPswd(),getList(emp));
		
		this.emp = emp;		
	}
	
	public EmpVO getEmp() {
		return this.emp;
	}
	
	public static List<SimpleGrantedAuthority> getList(EmpVO emp) {
		List<SimpleGrantedAuthority> authorities = 
				new ArrayList<SimpleGrantedAuthority>();
		//authList : {"a001":"ROLE_MEMBER","a001":"ROLE_ADMIN"}
		List<EmpAuth> authList = emp.getEmpAuth();
		for(EmpAuth auth : authList) {
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority(auth.getAuthority());
			authorities.add(authority);
		}
		
		return authorities;
	}
	
	
	
}




