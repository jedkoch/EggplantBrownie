//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Tiago Davi on 05/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    
    let delegate: AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate){
        
        super.init(nibName:"NewItemViewController", bundle: nil)
        
        self.delegate = delegate
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewItem(){
        
        if nameField == nil || caloriesField == nil {
            return
        }
        if delegate == nil {
            return
        }
        
        let name = nameField!.text
        let calories = NSString(string:caloriesField!.text).doubleValue
        
        let item = Item(name: name, calories: calories)
        
        delegate!.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}
