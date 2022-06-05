//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by TheGIZzz on 28/5/2565 BE.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Title here"
        cell.detailTextLabel?.text = "Detail here"
        return cell
    }

}

