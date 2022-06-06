package global.sesoc.Project_3jo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.Project_3jo.dao.home_productDAO;
import global.sesoc.Project_3jo.vo.home_product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	home_productDAO dao;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ArrayList<home_product> list =dao.select();
		
		logger.debug("상품 리스트 입니다.{}", list);
		
		model.addAttribute("home_product", list);
		
		ArrayList<home_product> listwoman =dao.selectwoman();
		
		model.addAttribute("home_productwoman", listwoman);
		
		ArrayList<home_product> listunisex =dao.selectunisex();
		
		model.addAttribute("home_productunisex", listunisex);
		
		ArrayList<home_product> best_order = dao.best_order();
		
		logger.debug("결제 상품 리스트 입니다.{}", best_order);
		
		model.addAttribute("best_order",best_order);
		
		
		return "home";
	}
	
	@RequestMapping(value = "po_baguni", method = RequestMethod.GET)
	public String po_baguni() {
		
		return "po_baguni";
	}

	
	

	@RequestMapping(value = "po_Search", method = RequestMethod.GET)
	public String po_Search() {
		
		return "po_Search";
	}
	
	
	//스트링변수 하나 생성
	@RequestMapping(value = "po_Search", method = RequestMethod.POST)
	public String po_Search(String [] season,String [] weather,String [] age_birth,
			String [] Scent, String [] pd_image, String[] sunmoon, String[] gender, Model model, String searchText) {

		//오후에해야함
		HashMap<String,Object> po2_Search = new HashMap<String, Object>();
		ArrayList<home_product> po_Search = null;
		
		
		if (season != null && season.length != 0) {
				
				po2_Search.put("season", season);
				
				System.out.println(season);	
		}
		if (weather != null && weather.length != 0) {
			
				po2_Search.put("weather", weather);
				
				System.out.println(weather);
		}
		if (age_birth != null && age_birth.length != 0) {
			
				po2_Search.put("age_birth", age_birth);
				
				System.out.println(age_birth);
			
		}
		if (Scent != null && Scent.length != 0) {
				
				po2_Search.put("Scent", Scent);
				
				System.out.println(Scent);
		}
		if (pd_image != null && pd_image.length != 0) {
				
				po2_Search.put("pd_image", pd_image);
				
				System.out.println(pd_image);
		}
		
		if (sunmoon != null && sunmoon.length != 0) {
		
				
				po2_Search.put("sunmoon", sunmoon);
				
				System.out.println(sunmoon);
		
		}
		
		if (gender != null && gender.length != 0) {

				
				po2_Search.put("gender", gender);
				
				System.out.println(gender);

		}
		
		
		if (searchText != null) {
			
			po2_Search.put("searchText", searchText);
			
			System.out.println(searchText);

		}
		
		po_Search = dao.search(po2_Search);
		
		System.out.println(po_Search);
		
		model.addAttribute("po_Search",po_Search);
		
		return "po_Search";
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "weather_list", method = RequestMethod.POST)
	public ArrayList<home_product> weather_list(String weather, Model model) {
		
		ArrayList<home_product> weather_list =dao.weather_list_select(weather);
		
		logger.info("너는 뭘들고 오니?.{}", weather_list);
		
		return weather_list;
	}
	
	
}

	

