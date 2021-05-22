//
//  DayListTableViewController.swift
//  Dday
//
//  Created by 유준용 on 2021/05/16.
//

import UIKit

class DayListTableViewController: UITableViewController{
        
    override func viewDidLoad() {
        tableView.delegate = self
        print(#function)
    
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        self.tableView.reloadData()
        print(Day.dayList.count)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Day.dayList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = Day.dayList[indexPath.row].title
        cell.textLabel?.text = UserDefaults.standard.string(forKey: "userTitle")
        
        
        
//        cell.detailTextLabel?.text = Day.dayList[indexPath.row].userDate
        cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "userDate")
        
        
        return cell
    }
    

}
