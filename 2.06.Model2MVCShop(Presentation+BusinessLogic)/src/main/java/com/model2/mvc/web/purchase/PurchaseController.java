package com.model2.mvc.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
public class PurchaseController {

	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
		
	
	public PurchaseController() {
	}
	
	@RequestMapping("/addPurchase.do")
	public String addPurchase(@RequestParam("purchase")Purchase purchase) throws Exception {
		System.out.println("/addPurchase.do");
		purchaseService.addPurchase(purchase);
			
		return "forward:/addPurchase.jsp";
	}
	
	public String getPurchase(@RequestParam("tranNo") int tranNo) throws Exception{
		System.out.println("/getPurchase.jsp");
		Purchase purchase = purchaseService.getPurchase(tranNo);
		return "forward:/getPurchase.jsp";
	}
	
	public String getPurchaseList() throws Exception{
		
		return "forward:/listPurchase.jsp";
	}

}
