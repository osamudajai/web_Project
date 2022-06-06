package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.ProductBig;
import global.sesoc.Project_3jo.vo.ProductBrand;
import global.sesoc.Project_3jo.vo.ProductDetail;
import global.sesoc.Project_3jo.vo.ProductInfo;
import global.sesoc.Project_3jo.vo.ProductList;
import global.sesoc.Project_3jo.vo.Product_cost;
import global.sesoc.Project_3jo.vo.Product_ml;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;


@Repository
public class ProductDAO {
private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	
	//빈으로 등록된 객체를 가져옴
	@Autowired
	SqlSession sqlSession;
	
		//대분류
		public int insertPdbi(ProductBig pdBig) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = 0;

			result = mapper.insertBi(pdBig);
			return result;	
		}
		//소분류
		public int insertPdbr(ProductBrand pdBrand) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = 0;

			result = mapper.insertBr(pdBrand);
			return result;
		}
		public int insertPdt(ProductInfo pdInfo) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = 0;

			result = mapper.insert(pdInfo);
			return result;
		}
		//용량
		public int insertPdml(Product_ml pdml) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = 0;

			result = mapper.insertMl(pdml);
			return result;
			
		}
		//가격
		public int insertPdct(Product_cost pdct) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = 0;

			result = mapper.insertCt(pdct);
			return result;
		}
		//상품목록페이지 출력
		public ArrayList<ProductList> select(String cate, int startRecord, int countPerPage) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			
			//전체 검색 결과 중 읽을 시작위치와 개수
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<ProductList> list = mapper.list(cate,rb);			
			return list;
		}
		//상품대분류페이지 출력
		public ArrayList<ProductList> selectCata(HashMap<String,Object> map, int startRecord, int countPerPage) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			//전체 검색 결과 중 읽을 시작위치와 개수
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<ProductList> list = mapper.listCatab(map, rb); 
			 	return list;
		 }
		//상품브랜드페이지 출력
		public ArrayList<ProductList> productlist(HashMap<String,Object> map, int startRecord, int countPerPage) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			//전체 검색 결과 중 읽을 시작위치와 개수
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<ProductList> list = mapper.listCata(map,rb);
			return list;	
		}
		public ArrayList<ProductList> selectBrand() {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ArrayList<ProductList> blist = mapper.bList();			
			return blist;
		}
		public ArrayList<ProductList> selectBig(String cata) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ArrayList<ProductList> blist = mapper.selectBig(cata);
			
			return blist;
		}	
		public ArrayList<ProductList> selectBb(HashMap<String, Object> map) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ArrayList<ProductList> bList = mapper.selectBb(map);
			return bList;
		}
				
		public ArrayList<ProductDetail> selectView() {
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		ArrayList<ProductDetail> listDetail = mapper.listView();
			return listDetail;
		}
		public ArrayList<ProductDetail> pdView(HashMap<String, Object> map) {
			
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ArrayList<ProductDetail> listDetail = mapper.pdView(map);
			return listDetail;
		}
		public ArrayList<ProductDetail> selectDetail(String cata) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ArrayList<ProductDetail> listDetail = mapper.listDetail(cata); 
			return listDetail;
		}
		public int getTotal(HashMap<String, String> map) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			
			int total = mapper.getTotal(map);
			return total;
		}
		public ArrayList<ProductDetail> selectAll(HashMap<String, Object> map) {
	         ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
	         ArrayList<ProductDetail> relatedList = mapper.relatedAll(map);
	         return relatedList;
	      }
		
		
		public ArrayList<ReviewVO> listReview(SearchVO search, int startRecord, int countPerPage) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<ReviewVO> reviewList = null;
			try {
				reviewList = mapper.listReview(search, rb);
				System.out.println("daodaodadoadodoadao : "+ reviewList);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return reviewList;
		}
		public ReviewVO getReview(int rv_num) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			ReviewVO review = mapper.getReview(rv_num);
			return review;
		}
		public int getTotalRv(SearchVO search) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int total = mapper.getTotalRv(search);
			return total;
		}
		//구매후기 저장
		public int insertReview(ReviewVO review) {
			ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
			int result = mapper.insertReview(review);
			return result;
		}
		
		
	      public ArrayList<ProductList> adminSelect(int startRecord, int countPerPage) {
	          ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
	          RowBounds rb = new RowBounds(startRecord, countPerPage);
	          ArrayList<ProductList> adminList = mapper.adminList(rb);
	          return adminList;
	       }
	       //어드민 페이징, 총 개수
	       public int getAdminTotal() {
	          ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
	          
	          int adminTotal = mapper.getAdminTotal();
	          return adminTotal;
	       }
		
		
		
}
