package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.home_product;

@Repository
public class PerfumeTellerDAO {
	
	
	@Autowired
	SqlSession sqlsession;

	public ArrayList<home_product> paffem_search(HashMap<String, Object> po2_Search) {
		
		PerfumeTellerMapper mapper = sqlsession.getMapper(PerfumeTellerMapper.class);
		
		ArrayList<home_product> Search_list = mapper.paffem_search(po2_Search);
		
		return Search_list;
	}
	
	

}
