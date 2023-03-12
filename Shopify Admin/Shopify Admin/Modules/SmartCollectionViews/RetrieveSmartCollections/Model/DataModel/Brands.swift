//
//  Brands.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import Foundation
struct Brands : Decodable
{
    var smart_collections : [BrandItem]
}

struct BrandItem : Decodable
{
    var id : Int?
    var title : String?
    var image : Image
}

struct Image : Decodable
{
    var src : String?
}

