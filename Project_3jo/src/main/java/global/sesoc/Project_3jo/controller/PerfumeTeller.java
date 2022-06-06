package global.sesoc.Project_3jo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.Project_3jo.dao.PerfumeTellerDAO;
import global.sesoc.Project_3jo.dao.home_productDAO;
import global.sesoc.Project_3jo.vo.home_product;

@Controller
public class PerfumeTeller {
	
	@Autowired
	PerfumeTellerDAO dao;
	
	
	
	@RequestMapping(value = "perfume_teller", method = RequestMethod.GET)
	public String perfume_teller() {
		
		return "perfume_teller";
	}
	
	@RequestMapping(value = "recommendation", method = RequestMethod.GET)
	public String recommendation() {
		
		return "recommendation";
	}
	
	
	@RequestMapping(value = "paffem", method = RequestMethod.POST)
	public String paffem(String  season,String  weather,String  age_birth,
			String Scent, String pd_image, String sunmoon, String gender,String sunmoon2, Model model) {
		
		HashMap<String, Object> paffem_Search = new HashMap<String, Object>();
		ArrayList<home_product> paffem_Search2 = null;

		if (season != null) {
			
			paffem_Search.put("season", season);
			
			System.out.println(season);
		}
		if (weather != null) {
			
			paffem_Search.put("weather", weather);
			
			System.out.println(weather);
		}
		
		if (age_birth != null) {
			
			paffem_Search.put("age_birth", age_birth);
			
			System.out.println(age_birth);
			
		}
		if (Scent != null) {
			
			paffem_Search.put("Scent", Scent);
			
			System.out.println(Scent);
		}
		if (pd_image != null) {
			
			paffem_Search.put("pd_image", pd_image);
			
			System.out.println(pd_image);
		}
		if (sunmoon != null) {
			
			paffem_Search.put("sunmoon", sunmoon);
			
			System.out.println(sunmoon);
			
		}
		if (gender != null) {
			
			paffem_Search.put("gender", gender);
			
			System.out.println(gender);
			
		}
		if (sunmoon2 != null) {
			
			paffem_Search.put("sunmoon2", sunmoon2);
			
			System.out.println(sunmoon2);
		}
		

		paffem_Search2 = dao.paffem_search(paffem_Search);

		System.out.println(paffem_Search2);

		model.addAttribute("paffem_Search2", paffem_Search2);

		return "paffem_result";
	}
	
	
	
	
}
