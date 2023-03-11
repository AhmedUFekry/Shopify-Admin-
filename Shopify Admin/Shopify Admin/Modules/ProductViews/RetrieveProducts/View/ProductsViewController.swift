//
//  ProductsViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 10/03/2023.
//

import UIKit
import Kingfisher

class ProductsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
   // var brandId : Int?
    
    var brandTitle : String?
    
    @IBOutlet weak var max_price: UILabel!
    
    @IBOutlet weak var min_price: UILabel!
    
    @IBOutlet weak var filter_slider: UISlider!
    var productsBrand : product?
    
    
    var arr_product : [productItem] = []
    let PRODUCTS_BRAND_URL = "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/products.json"
        
    var arr_product_filtered : [productItem]!
    
    var productsViewModel  = ProductsViewModel()
    
    @IBOutlet weak var collection_V: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filter_slider.isHidden = true
        max_price.isHidden = true
        min_price.isHidden = true

        // Do any additional setup after loading the view.
            //   guard let id = brandId else {return}
             
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
       

        productsViewModel.getproductsBrand(PRODUCTS_BRAND_URL: PRODUCTS_BRAND_URL)
        
        productsViewModel.bindingproductsBrand = { [self] in
            productsBrand = productsViewModel.ObservableproductsBrand
            for i in 0..<(productsBrand?.products.count ?? 0)
                        {
                            guard let item = productsViewModel.ObservableproductsBrand?.products[i] else {return}
                            arr_product.append(item)
                        }
                        DispatchQueue.main.async {
                            self.collection_V.reloadData()
                        }
        }
        self.collection_V.reloadData()
    }
    
    @IBAction func filter_btn(_ sender: Any) {
        filter_slider.isHidden = false
        max_price.isHidden = false
        min_price.isHidden = false
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        max_price.text = String(sender.value)+"$"
                let filter_arr = arr_product.filter{ Float($0.variants.first?.price ?? "0.0") ?? 0 <= sender.value}
                
                arr_product_filtered = filter_arr
                self.collection_V.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return productsBrand?.products.count ?? 0
        if filter_slider.isHidden
               {
                   return arr_product.count
               }
               return arr_product_filtered.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollectionViewCell
            if filter_slider.isHidden
                    {
                cell.product_image.kf.setImage(with: URL(string: arr_product[indexPath.row].image?.src ?? "https://media.istockphoto.com/id/1197832105/vector/male-hand-holding-megaphone-with-new-product-speech-bubble-loudspeaker-banner-for-business.jpg?s=170667a&w=0&k=20&c=OWf-oyKznoBmC0bj5mZpguiw2zrmHBtpJL0UumJcrrk="))
                        cell.product_price.text = arr_product[indexPath.row].variants.first?.price
                        return cell
                    }
            cell.product_image.kf.setImage(with: URL(string: arr_product_filtered[indexPath.row].image?.src ?? "https://media.istockphoto.com/id/1197832105/vector/male-hand-holding-megaphone-with-new-product-speech-bubble-loudspeaker-banner-for-business.jpg?s=170667a&w=0&k=20&c=OWf-oyKznoBmC0bj5mZpguiw2zrmHBtpJL0UumJcrrk="))
                        cell.product_price.text = arr_product_filtered[indexPath.row].variants.first?.price
                        return cell
        }
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width:self.view.frame.width*0.25, height: self.view.frame.height*0.25)
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetail = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as!ProductDetailsViewController
        if filter_slider.isHidden{
            productDetail.prodId = arr_product[indexPath.row].id
        }
        else{
            
            productDetail.prodId = arr_product_filtered[indexPath.row].id
        }
       
        
        navigationController?.pushViewController(productDetail, animated: true)
    }
    
    
    
  

}

