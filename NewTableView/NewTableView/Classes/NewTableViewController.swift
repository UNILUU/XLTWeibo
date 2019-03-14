//
//  NewTableViewController.swift
//  NewTableView
//
//  Created by  on 12/11/18.
//

import UIKit

class NewTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.prefetchDataSource = self
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        return cell
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10000
    }
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currntIndex = indexPath.row + 1
        let urlString = "https://dummyimage.com/1000/000/fff&text=\(currntIndex)"
        SessionManager.cancelTask(urlString: urlString)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currntIndex = indexPath.row + 1
        let urlString = "https://dummyimage.com/1000/000/fff&text=\(currntIndex)"
        cell.textLabel?.text = String(currntIndex)
        
        SessionManager.getImage(urlString: urlString) { (result) in
            if case .success(let image) = result {
                if let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell {
                    cell.imageView?.image = image
                    tableView .reloadRows(at: [indexPath], with: .none)
                }
            }
        }
    }

}



//extension NewTableViewController: UITableViewDataSourcePrefetching {
//
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        for index in indexPaths{
//            let currntIndex = index.row + 1
//            let urlString = "https://dummyimage.com/3000x3000/000/fff&text=\(currntIndex)"
//            SessionManager.downloadImage(urlString: urlString) { (_) in
//
//            }
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
//        for index in indexPaths{
//            let currntIndex = index.row + 1
//            let urlString = "https://dummyimage.com/3000x3000/000/fff&text=\(currntIndex)"
//            SessionManager.cancelTask(urlString: urlString)
//        }
//    }
//
//}
