//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Tiago Davi on 19/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class Dao {
    
    let mealsArchive: String
    let itemsArchive: String
    
    init() {
        
        let userDir = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true
        )
        let dir = userDir[ 0 ] as String
        
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func saveMeals(meals: Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    func saveItems(items: Array<Item>){
         NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    func loadMeals() -> Array<Meal>{
        if let loaded: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as Array<Meal>
        }else{
            return Array<Meal>()
        }
    }
    func loadItems() -> Array<Item>{
        if let loaded: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as Array<Item>
        }else{
            return Array<Item>()
        }
    }

}
