//
//  ProductDetailModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation


class imageDetail : Decodable{
    var src:String?
}

class Variant : Decodable{
    var price:String?
}


class detail : Decodable
{
    var title:String?
    var body_html:String?
    var variants:[Variant]
    var images:[imageDetail]
}


class ProductDetails : Decodable
{
    var product : detail

}


