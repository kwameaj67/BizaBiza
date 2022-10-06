//
//  Shop.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

struct Shop {
    var name: String
    var price: String
    var pickups: String
    var delivery: String
    
    
    
    static let shopData: [Shop] = [
        Shop(name: "Groceries and home", price: "As low as GH₵500", pickups: "7 nearby", delivery: "Delivery in 2 mins"),
        Shop(name: "Laundry services", price: "As low as GH₵100", pickups: "20 nearby", delivery: "Pickup in 5 mins"),
        Shop(name: "Groceries and home", price: "As low as GH₵230", pickups: "14 nearby", delivery: "Delivery 10 mins"),
        Shop(name: "Laundry and home", price: "As low as GH₵800", pickups: "3 nearby", delivery: "Delivery 20 mins"),
    ]
}
enum ShopType : String {
    case restaurant = "Restaurant"
    case buka = "Buka"
}
struct BizaShop {
    
    var title: String
    var type: ShopType
    var location:String
    var rating: Double
    var numberOfRatings: Int
    var completedOrders: Int
    
    
    static let bizaShopData : [BizaShop] = [
        BizaShop(title: "La Cibo GH", type: .restaurant, location: "No 8 fati street surulere", rating: 4.5 , numberOfRatings: 1005, completedOrders: 550),
        BizaShop(title: "Ofada boy GH", type: .restaurant, location: "No 8 fati street surulere, Lagos", rating: 3.5 , numberOfRatings: 45, completedOrders: 60),
        BizaShop(title: "Amala shitta GH", type: .buka, location: "No 8 fati street surulere, Lagos", rating: 2.5 , numberOfRatings: 135, completedOrders: 220),
        BizaShop(title: "La Cibo GH", type: .buka, location: "No 8 fati street surulere, Lagos", rating: 5.0 , numberOfRatings: 10005, completedOrders: 830),
    ]
}
