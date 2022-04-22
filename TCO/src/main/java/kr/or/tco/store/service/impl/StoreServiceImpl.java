package kr.or.tco.store.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.tco.store.mapper.StoreMapper;
import kr.or.tco.store.service.StoreService;
import kr.or.tco.store.vo.StoreVO;
import kr.or.tco.strgstck.mapper.StrgstckMapper;
import kr.or.tco.strgstck.vo.StrgstckVO;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreMapper storeMapper;
	
	@Autowired
	StrgstckMapper strgstckMapper;
	
	//지점의 매장 출고목록 뽑기 - 소비자판매 테이블에서 지점으로 걸러서 가져오기
	@Override
	public List<StoreVO> storeShipList(String brncofcId){
		return this.storeMapper.storeShipList(brncofcId);
	}
	
	//지점의 매장 부족재고 현황을 뽑기 위한 테이블 만들기(지점의 모든 제품 현황임)
	@Override
	public List<StoreVO> storeLackList(String brncofcId){
		return this.storeMapper.storeLackList(brncofcId);
	}
	
	//상품별 채울 재고수(안전재고 * 2) - 현재고
	@Override
	public int refillQtyShop(Map<String, Object> map) {
		return this.storeMapper.refillQtyShop(map);
	}
	
	//재고보충 버튼을 눌렀을 때 매장재고 update
	@Override
	public int shopRefill(Map<String, Object> map) throws Exception {
		int count = 0;
		
		//매장재고 update
		count += this.storeMapper.shopRefill(map);
		//창고재고 update
		count += this.strgstckMapper.refillStorage(map);
		//창고출고 insert
		count += this.strgstckMapper.refillInsert(map);
		
		return count;
	}
	
	//소비자판매용 매장재고 update
	@Override
	public int shopSell(Map<String, Object> map){
		return this.storeMapper.shopRefill(map);
	}
	
	
}
