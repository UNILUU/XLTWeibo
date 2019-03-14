//
//  ViewController.swift
//  TableView
//
//  Created by  on 12/9/18.
//

import UIKit

class myTableViewController: UITableViewController {
//    lazy var imageDict : [Int : UIImage] = Dictionary()
//    lazy var taskDict : [ : URLSessionDataTask] = Dictionary()

    lazy var cache = NSCache<URLSessionDataTask, UIImage> ()//urlString, image
    let session = URLSession(configuration: URLSessionConfiguration.default)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let currntIndex = indexPath.row + 1
        cell.textLabel?.text = String(currntIndex)

        let urlString = "http://dummyimage.com/2000x2000/000/fff&text=\(currntIndex)"
        if let url = URL(string: urlString) {
            return cell
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {
                print("cannot get image")
                return
            }
            self.cache.setObject(image, forKey: dataModal)
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.setNeedsLayout()
                cell.updateConstraintsIfNeeded()
            }
        }
        
        
        if let img =  cache.object(forKey: dataModal){
                        cell.imageView?.image = img
                        cell.setNeedsLayout()
                        cell.updateConstraintsIfNeeded()
                        return cell
        }
        print("--------start downloading \(currntIndex) -----------")
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard error == nil, let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {
                print("cannot get image")
                return
            }
            self.cache.setObject(image, forKey: dataModal)
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.setNeedsLayout()
                cell.updateConstraintsIfNeeded()
            }
        }
//        taskDict[currntIndex] = task
        task.resume()

        return cell
    }
//
//    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let currntIndex = indexPath.row + 1
//        guard imageDict[currntIndex] == nil , let task = taskDict[currntIndex] else {
//            return
//        }
//        print("--------cancel downloading \(currntIndex) -----------")
//        task.cancel()
//        taskDict[currntIndex] = nil
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
//
//
//extension myTableViewController : UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//
//    }
//
//    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
//        for indexpath in indexPaths{
//
//        }
//    }
//}


