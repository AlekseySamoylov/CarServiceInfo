//
//  WorkGroupKindVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import Foundation

class WorkGroupKindVC: UIViewController, RepositoryDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let repository = Repository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        repository.delegate = self
       
        downloadWorkData()
    }
    
    func downloadWorkData(){
        Alamofire.request(WORK_GROUPS_URL).responseString { response in
            switch response.result {
            case .success(let value):
                self.repository.setWorkGroups(jsonString: value)
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
        
    // Возвращает колличество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.getWorkGroups().count//1//repository.getWorkGroups()[section].works.count
    }
    
    // Заполняет ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkGroupCell", for: indexPath) as! WorkGroupCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    // Заполняет элементы каждого поля
    func configureCell(cell: WorkGroupCell, indexPath: NSIndexPath) {
        let item = repository.getWorkGroups()[indexPath.row]
        cell.configureCell(item: item)
    }
    
    // Забирает объект из выбранной ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workGroup = repository.getWorkGroups()[indexPath.row]
        performSegue(withIdentifier: "WorkListSegue", sender: workGroup)
    }
    
    // Передает объект в следующий StoryBoard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkListSegue" {
            if let destination = segue.destination as? WorkGroupVC {
                if let item = sender as? WorkGroup {
                    destination.workGroupItem = item
                }
            }
        }
    }
    
    
    // Возвращает высоку ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func workGroupsLoaded(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    func coordinatesLoaded(){
        
    }
    
    
}
