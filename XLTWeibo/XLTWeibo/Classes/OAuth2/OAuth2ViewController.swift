//
//  OAuth2ViewController.swift
//  XLTWeibo
//
//  Created by  on 12/5/18.
//  Copyright © 2018 Xiaolu Tian. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuth2ViewController: UIViewController {
    let webView = UIWebView()
//    let session = SFAuthenticationSession()
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
}


//MARK: UI layout
extension OAuth2ViewController{
    private func layoutView() {
        navigationItem.title = "Log in"
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.delegate = self
        view.addSubview(webView)
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(OAuth2ViewController.closeClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Auto Fill", style: .plain, target: self, action: #selector(OAuth2ViewController.autoFillClicked))
        
        let url = URL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(callback)")
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }
}

//MARK: Event Handle
extension OAuth2ViewController{
    @objc private func closeClicked() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func autoFillClicked() {
        let jsCode = "document.getElementById('userId').value='iceeluu@gmail.com';document.getElementById('passwd').value='AsZx02';"
        
        webView.stringByEvaluatingJavaScript(from: jsCode)
        
    }
}


//MARK: WebViewDelegate
extension OAuth2ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show(withStatus: "Loading")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        guard let url = request.url else {
            return true
        }
        let urlString = url.absoluteString
        guard urlString.contains("code=") else {
            return true
        }
        let code = urlString.components(separatedBy: "code=").last

        getAccessToken(code: code!)
        return false
    }
}

//MARK : get accesstoken and profile
extension OAuth2ViewController {
    private func getAccessToken(code: String) {
        NetWorkingManager.shareInstance.loadAccessToken(code: code) { (result , error)in
            guard error == nil else {
                print(error!)
                return
            }
            guard let result = result else {
                print("error parse access token result")
                return
            }
            let userAcct = UserAccount()
            userAcct.setAccountData(dic: result)
            self.loadUserInfo(userAcct)
        }
    }
    
    private func loadUserInfo(_ userAccount: UserAccount) {
        guard let token = userAccount.access_token else {
            return
        }
        guard let uid = userAccount.uid else {
            return
        }
        NetWorkingManager.shareInstance.getProfileInfo(access_token: token, uid: uid) { (result, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let resultDic = result else{
                return
            }
            userAccount.setAccountData(dic: resultDic)
            print(userAccount)
            print(UserModal.sharedInstance.accountPath)
            
            NSKeyedArchiver.archiveRootObject(userAccount, toFile: UserModal.sharedInstance.accountPath)
            UserModal.sharedInstance.user = userAccount

            //dismiss authentication view
            self.dismiss(animated: false, completion: {
                UIApplication.shared.keyWindow?.rootViewController = WelcomeViewController()
            })
        }
    }

}





