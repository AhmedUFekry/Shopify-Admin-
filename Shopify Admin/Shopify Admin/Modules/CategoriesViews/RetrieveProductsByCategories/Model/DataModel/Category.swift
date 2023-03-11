//
//  product.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import Foundation

class CategoryItem : Decodable
{
    var id : Int?
    var title : String?
}

class Category : Decodable
{
    var custom_collections : [CategoryItem]

}

//************
class ProductImage : Decodable
{
    var id :Int?
    var product_id : Int?
    var src : String?
}
class Prices : Decodable
{
    var id : Int?
    var price : String?
}

class productItem : Decodable
{
    var id : Int?
    var product_type : String?
    var image : ProductImage?
    var variants : [Prices]
}
class product : Decodable {
    var products : [productItem]
}

