package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.Project_3jo.vo.home_product;


public interface home_productMapper {
	public ArrayList<home_product> select();
	
	public ArrayList<home_product> selectwoman();
	
	public ArrayList<home_product> selectunisex();
	
	public ArrayList<home_product> search(HashMap<String,Object> po2_Search);

	public ArrayList<home_product> best_order();

	public ArrayList<home_product> weather_list_select(String weather);
	
}
