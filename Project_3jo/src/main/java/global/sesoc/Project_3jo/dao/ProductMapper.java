package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.ProductBig;
import global.sesoc.Project_3jo.vo.ProductBrand;
import global.sesoc.Project_3jo.vo.ProductDetail;
import global.sesoc.Project_3jo.vo.ProductInfo;
import global.sesoc.Project_3jo.vo.ProductList;
import global.sesoc.Project_3jo.vo.Product_cost;
import global.sesoc.Project_3jo.vo.Product_ml;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;

public interface ProductMapper {
	
	//대분류 저장
	public int insertBi(ProductBig pdBig);
	//브랜드 저장
	public int insertBr(ProductBrand pdBrand);
	//상품목록 저장
	public int insert(ProductInfo pdInfo);
	//용량 저장
	public int insertMl(Product_ml pdml);
	//가격 저장
	public int insertCt(Product_cost pdct);
	//전체 상품목록 조회
	public ArrayList<ProductList> list(String cate, RowBounds rb);
	
	//브랜드명 중복없이 조회
	public ArrayList<ProductList> bList();
	//브랜드명 중복없이 대분류안에서 브랜드 조회
	
	public ArrayList<ProductList> selectBig(String cata);
	//브랜드명 중복없이 브랜드페이지 안에서 같은 대분류에 속한 브랜드 출력
	public ArrayList<ProductList> selectBb(HashMap<String, Object> map);
	//상품대분류페이지 출력
	public ArrayList<ProductList> listCata(HashMap<String, Object> map, RowBounds rb);
	//상품소분류페이지 출력
	public ArrayList<ProductList> listCatab(HashMap<String, Object> map, RowBounds rb);
	//상품 상세정보 조회
	public ArrayList<ProductDetail> listView();
	
	public ArrayList<ProductDetail> pdView(HashMap<String, Object> map);
	
	public ArrayList<ProductDetail> listDetail(String cata);
	//페이징
	public int getTotal(HashMap<String,String> map);
	//정렬기능 구현 
	/* public ArrayList<ProductList> priceDesc(String cate); */
	
	public ArrayList<ProductList> selectPrice(HashMap<String,Object> map);
	
	public ArrayList<ProductDetail> relatedAll(HashMap<String, Object> map);
	
	
	//구매후기 게시판 가져오기
		public ArrayList<ReviewVO> listReview(SearchVO search, RowBounds rb);
		public ReviewVO getReview(int rv_num);
		public int getTotalRv(SearchVO search);
		//구매후기 저장
		public int insertReview(ReviewVO review);
		
		//상품조회
		   public ArrayList<ProductList> adminList(RowBounds rb);
		   //상품총개수, 페이징
		   public int getAdminTotal();
	

}
