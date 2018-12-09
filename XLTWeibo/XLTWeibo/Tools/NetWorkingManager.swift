//
//  NetWorking.swift
//  XLTWeibo
//
//  Created by  on 12/6/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestType {
    case GET
    case POST
}
class NetWorkingManager : AFHTTPSessionManager{
    
    
    //let is thread safe
    
    //singleton
    static let shareInstance : NetWorkingManager = {
        let tool = NetWorkingManager()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        tool.responseSerializer.acceptableContentTypes?.insert("text/json")
        tool.responseSerializer.acceptableContentTypes?.insert("text/javascript")
        
        return tool
    }()
    
    
    
    func request(methodType : RequestType, urlString : String, parameters : [String : Any], finished : @escaping (_ result: Any?, _ error: Error?) -> ()) {
        let successCompletion = { (task: URLSessionDataTask, result: Any?) -> Void in
            finished(result, nil)
        }
        let failCompletion = {(task: URLSessionDataTask?, error: Error) -> Void in
            finished(nil, error)
        }
        if methodType == .GET{
            get(urlString, parameters: parameters, progress: nil, success: successCompletion, failure: failCompletion)
        }else{
            post(urlString, parameters: parameters,progress: nil, success: successCompletion, failure: failCompletion)
        }
    }
    
}



//MARK:Get AccessToken
extension NetWorkingManager {
    func loadAccessToken(code: String,completion: @escaping (_ result: [String: Any]?, _ error: Error?) -> ()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let parameters : [String: Any] = ["client_id" : AppKey, "client_secret" : AppSecret, "grant_type" : "authorization_code", "redirect_uri" : callback, "code" : code]
        
        request(methodType: .POST, urlString: urlString, parameters: parameters) { (result,error) in
            completion(result as? [String: Any], error)
        }
    }
}


//MARK: GET USER Profile
extension NetWorkingManager{
    func getProfileInfo(access_token: String, uid: String, completion: @escaping ( _ result: [String: Any]? , _ error: Error?) ->()){
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        
        let parameters = ["access_token" : access_token, "uid" : uid]
        
        request(methodType:.GET, urlString: urlString, parameters: parameters) { (result, error) -> () in
            guard error == nil else {
                print(error!)
                return
            }
            if let resultDict = result as? [String : AnyObject]{
                completion(resultDict,error)
            }
        }
    }
}


//MARK : GET HOME - TIMELINE
extension NetWorkingManager {
    func getHomeTimeLine(completion: @escaping (_ result : [[String: Any]]?, _ error: Error? ) -> ()) {
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        let parameter = ["access_token" : UserModal.sharedInstance.user!.access_token]
        
        request(methodType: .GET, urlString: urlString, parameters: parameter) { (_ result, _ error)  -> () in
            guard error == nil else {
                print(error!)
                return
            }
            guard let resultDic = result as? [String: Any] else{
                return
            }
            if let timelineDic = resultDic["statuses"] as? [[String: Any]] {
               completion(timelineDic, error)
            }
        }
    }
}










