//
//  ContentViewController.swift
//  
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit

class ContentViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.backgroundColor = .green
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [
          .flexibleWidth,
          .flexibleHeight
        ]
        
        tableView.layoutIfNeeded()
        
        tableView.dataSource = self
    }
}


extension ContentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell.textLabel?.text = "ほげほげ"
            
            return cell
        }
        
        return UITableViewCell()
    }
}
