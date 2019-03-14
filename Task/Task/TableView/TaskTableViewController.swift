//
//  DataViewController.swift
//  Task
//
//  Created by  on 1/27/19.
//

import UIKit

class TaskTableViewController: UITableViewController {

    var dataObject = [Task]()
    let type : TaskType
    init(task : TaskType){
        type = task
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        return UITableViewCell()
    }
    

    
    
    
}

