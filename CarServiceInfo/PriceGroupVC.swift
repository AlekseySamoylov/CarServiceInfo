//
//  GroupKindVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit
import CoreData

class PriceGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    var priceGroupItem: PriceGroup?
    var priceArray: [Price]?

    @IBOutlet weak var tableView: UITableView!
    var controller: NSFetchedResultsController<Price>!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let groupItem = priceGroupItem {
            priceArray = Array(groupItem.toPrice!) as? [Price]

        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceCell
        cell = configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: PriceCell, indexPath: NSIndexPath) -> PriceCell {
        let item = priceArray?[indexPath.row]
        cell.configureCell(item: item!)
        return cell
    }
    
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath)
            
                let item = priceArray?[indexPath.row]
                performSegue(withIdentifier: "PriceDetailsSegue", sender: item)
            
        }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print(segue.identifier)
            if segue.identifier == "PriceDetailsSegue" {
                if let destination = segue.destination as? PriceVC {
                    if let item = sender as? Price {
                        destination.priceItem = item
                    }
                }
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = priceArray?.count {
            return count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
   
}
