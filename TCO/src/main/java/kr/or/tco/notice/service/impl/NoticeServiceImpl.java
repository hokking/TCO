package kr.or.tco.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.tco.emp.vo.AttachFilesVO;
import kr.or.tco.notice.mapper.NoticeMapper;
import kr.or.tco.notice.service.NoticeService;
import kr.or.tco.notice.vo.BrdVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public List<BrdVO>mainnotice(){
		return noticeMapper.mainnotice();
	}
	
	@Override
	public List<BrdVO> noticelist(Map<String, Object> map) {
		return noticeMapper.noticelist(map);
	}

	@Override
	public int selectCount(Map<String, Object> map) {
		return noticeMapper.selectCount(map);
	}

	@Override
	public String selectname(String empId) {
		return noticeMapper.selectname(empId);
	}

	@Override
	public BrdVO noticedetail(int brdId) {
		return noticeMapper.noticedetail(brdId);
	}

	@Override
	public int noticeinsert(BrdVO brdVO) {
		return noticeMapper.noticeinsert(brdVO);
	}

	@Override
	public int insertAttachFiles(AttachFilesVO attachFilesVO) {
		return noticeMapper.insertAttachFiles(attachFilesVO);
	}

	@Override
	public int noticevi(int brdId) {
		return noticeMapper.noticevi(brdId);
	}

	@Override
	public int noticeupdate(BrdVO brdVO) {
		return noticeMapper.noticeupdate(brdVO);
	}

	@Override
	public int noticedelete(String brdId) {
		return noticeMapper.noticedelete(brdId);
	}

}
