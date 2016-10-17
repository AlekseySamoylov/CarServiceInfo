//
//  PriceGroupKindVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit
import CoreData

class PriceGroupKindVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    var controller: NSFetchedResultsController<PriceGroup>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        initPriceGroupKindArray()

        attemptFetch()


        // Do any additional setup after loading the view.
    }


    
    // Возвращает количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        } else {
            return 0
        }
    }
    
    // Возвращает колличество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        } else {
            return 0
        }
    }
    
    // Заполняет ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceGroupCell", for: indexPath) as! PriceGroupCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    // Заполняет элементы каждого поля
    func configureCell(cell: PriceGroupCell, indexPath: NSIndexPath) {
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
    }
    
    // Забирает объект из выбранной ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = controller.fetchedObjects, objects.count > 0 {
            let item = objects[indexPath.row]
            performSegue(withIdentifier: "PriceListSegue", sender: item)
        }
    }
    
    // Передает объект в следующий StoryBoard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PriceListSegue" {
            if let destination = segue.destination as? PriceGroupVC {
                if let item = sender as? PriceGroup {
                    destination.priceGroupItem = item
                }
            }
        }
    }
    
    
    // Возвращает высоку ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // Забирает объекты из CoreData
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<PriceGroup> = PriceGroup.fetchRequest()
        let titleSort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [titleSort]
        
        
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller

        do {
            
            try controller.performFetch()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
    }
    
    // Обновляет CoreData
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    // Обновляет CoreData
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
    func initPriceGroupKindArray() {
        
            let price1 = Price(context: context)
            price1.title = "Ремонт двигателя"
            price1.details = "Очень ответственная операция"
            price1.price = "Цена от 40 000 р."
            let price2 = Price(context: context)
            price2.title = "Ремонт Подвески"
            price2.details = "Очень ответственная операция"
            price2.price = "Цена от 30 000 р."
            let price3 = Price(context: context)
            price3.title = "Ремонт АКПП"
            price3.details = "Очень ответственная операция"
            price3.price = "Цена от 90 000 р."
            
            let priceGroup1 = PriceGroup(context: context)
            priceGroup1.title = "Range Rover Voque"
            priceGroup1.addToToPrice(price1)
            priceGroup1.addToToPrice(price2)
            priceGroup1.addToToPrice(price3)
            let priceGroup2 = PriceGroup(context: context)
            priceGroup2.title = "Range Rover Sport"
//            priceGroup2.title = "Range Rover Voque"
//            priceGroup2.addToToPrice(price1)
//            priceGroup2.addToToPrice(price2)
//            priceGroup2.addToToPrice(price3)
            let priceGroup3 = PriceGroup(context: context)
            priceGroup3.title = "Range Rover Evoque"
//            priceGroup3.title = "Range Rover Voque"
//            priceGroup3.addToToPrice(price1)
//            priceGroup3.addToToPrice(price2)
//            priceGroup3.addToToPrice(price3)

            
    
        
        
    
    }

}
