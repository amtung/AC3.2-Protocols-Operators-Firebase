//
//  ShoppingCartItem.swift
//  Shopping Cart Protocols
//
//  Created by Louis Tur on 1/30/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingCartItem: CustomStringConvertible, Hashable, Comparable {
  let price: Double
  let name: String
  let sku: Int
  let quantity: Int
  
  var description: String {
    return String(format: "%@ $%0.2f", name, price)
  }
  
  var hashValue: Int {
    return sku.hashValue ^ price.hashValue
  }
  
  static func ==(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
//    print("Comparing \(lhs)  \(rhs)")
    return lhs.sku == rhs.sku
  }
  
  // TODO: Comparabarability
  static func >(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
    return lhs.price > rhs.price
  }
  
  static func >=(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
    return lhs.price >= rhs.price
  }
  
  static func <(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
    return lhs.price < rhs.price
  }
  
  static func <=(lhs: ShoppingCartItem, rhs: ShoppingCartItem) -> Bool {
    return lhs.price <= rhs.price
  }
  
}


infix operator *^
func *^(lhs: ShoppingCartItem, rhs: ShoppingCartItem) {
  print("We have \(lhs) & \(rhs)")
}

postfix operator ^*^
postfix func ^*^(x: ShoppingCartItem) {
  print("MEEEEEOOOOOOOOWW \(x)")
}

postfix func ^*^(x: Double) {
  print("MEEEEEOOOOOOOOWW \(x)")
}

infix operator ><
func ><(lhs: CGFloat, rhs: CGFloat) -> CGPoint {
  return CGPoint(x: lhs, y: rhs)
}

// this apparently is allowed to be defined, but not actually called. hmm 🤔
infix operator *
public func *(lhs: CGFloat, rhs: Float) -> Float {
  return Float(lhs) * rhs 
}





enum CartSort {
  case ascending, descending
}
class ShoppingCart {
  
  var cartItems: [ShoppingCartItem] = []
  var fullCartItems: [ShoppingCartItem : Int] = [:]
  
  func addToCart(item: ShoppingCartItem, quantity: Int) {
    self.cartItems.append(item)
    self.fullCartItems[item] = (fullCartItems[item] ?? 0) + quantity
  }
  
  func quantityForItem(item: ShoppingCartItem) -> Int? {
    return fullCartItems[item]
  }
  
  func sortedCart(_ type: CartSort) -> [ShoppingCartItem] {
    switch type {
      
    case .ascending:
      print("Ascending")
      return self.cartItems.sorted(by: <)
      
    case .descending:
      print("Descending")
      return self.cartItems.sorted(by: >)
    }
  }
}

class ShoppingSession {
  var shoppingCart = ShoppingCart()
  
  static let shared: ShoppingSession = ShoppingSession()
  private init() { }
  
  
  
}
