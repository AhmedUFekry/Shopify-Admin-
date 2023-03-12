//
//  Brands.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import Foundation
class Brands : Decodable
{
    var smart_collections : [BrandItem]
}

class BrandItem : Decodable
{
    var id : Int?
    var title : String?
    var image : Image
}

class Image : Decodable
{
    var src : String?
}

