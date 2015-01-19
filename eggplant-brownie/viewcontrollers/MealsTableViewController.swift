//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Tiago Davi on 01/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = Array<Meal>()
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.meals = Dao().loadMeals()
    }
    func add(meal:Meal){
        
        meals.append(meal)
        
        Dao().saveMeals(meals)
        
        tableView.reloadData()
    }
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.Began {
            
            let cell = recognizer.view as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil {
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
          
            RemoveMealController(controller: self).show(meal, { action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
            })
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return meals.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        if let textLabel = cell.textLabel {
            textLabel.text = meal.name
        }
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        
        cell.addGestureRecognizer(longPress)
        
        return cell
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal"{
            let view = segue.destinationViewController as ViewController
            view.delegate = self
        }
    }
   
}
