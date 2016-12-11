//
//  GroupKindVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit
import CoreData

class WorkGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var workGroupItem: WorkGroup?
    var workArray: [Work]?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let groupItem = workGroupItem{
            workArray = groupItem.works
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WorkCell", for: indexPath) as! WorkCell
        cell = configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: WorkCell, indexPath: NSIndexPath) -> WorkCell {
        let item = workArray?[indexPath.row]
        cell.configureCell(item: item!)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        let item = workArray?[indexPath.row]
        performSegue(withIdentifier: "WorkDetailsSegue", sender: item)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        if segue.identifier == "WorkDetailsSegue" {
            if let destination = segue.destination as? WorkVC {
                if let item = sender as? Work {
                    destination.workItem = item
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = workArray?.count {
            return count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
