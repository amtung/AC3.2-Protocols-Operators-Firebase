//
//  ViewController.swift
//  Shopping Cart Protocols
//
//  Created by Louis Tur on 1/30/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class ViewController: UIViewController {
  
  let databaseReference = FIRDatabase.database().reference().child("items")
  var databaseObserver: FIRDatabaseHandle?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    setupViewHierarchy()
    configureConstraints()
    
    setObserver()
    testAddingAnItem()
  }
  
  private func setObserver() {
    databaseObserver = databaseReference.observe(.childAdded, with: { (snapshot: FIRDataSnapshot) in
      dump(snapshot)
    })
  }
  
  func testAddingAnItem() {
    let newItem = ShoppingCartItem(price: 28.00, name: "General Romance Novel, 2017: by Gabe", sku: 100000031, quantity: 3)
    
    let newItemRef = databaseReference.childByAutoId()
    let newItemDetails: [String : AnyObject] = [
      "price" : newItem.price as AnyObject,
      "name" : newItem.name as AnyObject,
      "sku" : newItem.sku as AnyObject,
      "quantity" : newItem.quantity as AnyObject
    ]
    newItemRef.setValue(newItemDetails)
  }
  
  private func configureConstraints() {
    
  }
  
  private func setupViewHierarchy() {
    
  }
  

}

