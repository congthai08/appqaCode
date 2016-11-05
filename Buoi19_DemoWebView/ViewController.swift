//
//  ViewController.swift
//  Buoi19_DemoWebView
//
//  Created by Huỳnh Công Thái on 11/4/16.
//  Copyright © 2016 Huỳnh Công Thái. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: UIWebView!
    var arrHistory:Array<URL> = Array<URL>()
    var index:Int = 0
    
    var tenbien:String
    {
        return "abc"
    }
    
    var duongdan:String
    {
//        var link:String = txtUrl.text!.lowercased()
//        
//        if !link.hasPrefix("http:") && !link.hasPrefix("https:")
//        {
//            link = "http://\(link)"
//        }
//        
//        if let url:URL = URL(string: link)
//        {
//            return url
//        }
//        else
//        {
//            return URL(string: "http://google.com")!
//        }
        
        let s:String = txtUrl.text!
        return s

    }
    
    
    @IBAction func btnReload(_ sender: Any) {
        webView.reload()
        print(duongdan)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        if arrHistory.count > 0
        {
            index = index + 1
            if index > arrHistory.count - 1
            {
                index = index - 1
                //ve an button
            }
            loadWeb(url: arrHistory[index])
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        if arrHistory.count > 0
        {
            index = index - 1
            if index < 0
            {
                index = 0
                //ve an button
            }
            loadWeb(url: arrHistory[index])
        }
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        
        var link:String = txtUrl.text!.lowercased()
        
        if !link.hasPrefix("http:") && !link.hasPrefix("https:")
        {
            link = "http://\(link)"
        }
        
        if let url:URL = URL(string: link)
        {
            arrHistory.append(url)
            index = arrHistory.count - 1
            loadWeb(url: url)
        }
        else
        {
            let url:URL = URL(string: "http://google.com")!
            loadWeb(url: url)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadWeb(url:URL)
    {
        let req:URLRequest = URLRequest(url: url)
        webView.loadRequest(req)
    }
    
    
}

