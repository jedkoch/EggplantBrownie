//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Tiago Davi on 16/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class RemoveMealController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    func show(meal:Meal, handler: (UIAlertAction!) -> Void){
        let details = UIAlertController(
            title: meal.name,
            message: meal.details(),
            preferredStyle: UIAlertControllerStyle.Alert
        )
        let cancel = UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil
        )
        let remove = UIAlertAction(
            title: "Remove",
            style: UIAlertActionStyle.Destructive,
            handler: handler
        )
        details.addAction(cancel)
        details.addAction(remove)
        
        controller.presentViewController(details, animated: true, completion: nil)
    }
}