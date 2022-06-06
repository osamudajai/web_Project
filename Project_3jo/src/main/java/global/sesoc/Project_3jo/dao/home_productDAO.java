package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.home_product;

@Repository
public class home_productDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	
	public ArrayList<home_product> select() {
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		ArrayList<home_product> list = mapper.select();
		return list;
	}
	
	public ArrayList<home_product> selectwoman() {
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		ArrayList<home_product> listwoman = mapper.selectwoman();
		return listwoman;
	}
	
	public ArrayList<home_product> selectunisex() {
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		ArrayList<home_product> listunisex = mapper.selectunisex();
		return listunisex;
	}
	
	
	public ArrayList<home_product> search(HashMap<String,Object> po2_Search) {
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		ArrayList<home_product> Search_list = mapper.search(po2_Search);
		
		return Search_list;
	}

	public ArrayList<home_product> best_order() {
		
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		ArrayList<home_product> best_order = mapper.best_order();
		
		return best_order;
	}

	public ArrayList<home_product> weather_list_select(String weather) {
		home_productMapper mapper = sqlSession.getMapper(home_productMapper.class);
		
		ArrayList<home_product>  weather_list = mapper.weather_list_select(weather);
		return weather_list;
	}
	

		
}
