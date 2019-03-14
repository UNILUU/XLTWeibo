
//
//  SessionManager.swift
//  NewTableView
//
//  Created by  on 12/11/18.
//

import Foundation

import UIKit


enum Result<T> {
    case success(T?)
    case failure
}

class SessionManager {
    static let cache = NSCache<NSString, UIImage>()
    static var dict = [String: URLSessionDataTask]()
    static var operationQ = OperationQueue()
    
    
    static func downloadImage(urlString: String, completion: @escaping (_ result: Result<UIImage>) -> ()){
        guard let url = URL(string: urlString) else {
            completion(Result.failure)
            return
        }
        operationQ.maxConcurrentOperationCount = 4
        guard let imagedata = try? Data(contentsOf: url) else {
            print("There was an error!")
            return
        }
         print("start ---  \(urlString)")
        let operation = BlockOperation {
            if let image = UIImage(data: imagedata) {
                cache.setObject(image, forKey: urlString as NSString)
                OperationQueue.main.addOperation({
                    completion(Result.success(nil))
                })
            }
        }

    
        operationQ.addOperation(operation)
        
    }
    
    
    static func getImage(urlString: String, completion: @escaping (_ result: Result<UIImage> ) -> ()){
        if let image = cache.object(forKey: urlString as NSString){
            completion(Result.success(image))
            return
        }
        
        
        downloadImage(urlString: urlString, completion: completion)
    }
    
    static func cancelTask(urlString: String){
        if let task = dict[urlString]{
            print("cancel ------------------------\(urlString)")
            task.cancel()
            dict[urlString] = nil
        }
    }
    
}
