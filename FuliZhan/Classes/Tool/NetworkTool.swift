
//
//  NetworkTool.swift
//  News_swift
//
//  Created by 123 on 2018/10/16.
//  Copyright © 2018年 jingying. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreFoundation
protocol NetworkToolProtocol {

    //平台数据
    static func loadMyChannels(url:String,completionHandler:@escaping (_ videos:[Video]) -> ())
    //主播列表数据
    static func loadMyAnchors(url:String,completionHandler:@escaping (_ videos:[Video]) -> ())
    
    
}

extension NetworkToolProtocol{


    
    static func loadMyChannels(url:String,completionHandler:@escaping (_ videos:[Video]) -> ()) {
        //创建会话对象
        let session     = URLSession.shared
        let serUrl      = URL(string:url)
        var request     = URLRequest(url: serUrl!)
        
        //设置访问方式为POST
        request.httpMethod = "GET"
        
        //设置POST 内容
        //        request.httpBody = getBody(params: params).data(using: String.Encoding.utf8)
        //        let data = try JSONSerialization.data(withJSONObject: params, options: options)
        //        request.httpBody = data;
        //开始访问
        let dataTask : URLSessionDataTask = session.dataTask(with: request) { (data, respones, error)  -> Void  in
            
            //访问结束
            if(error != nil) {
                //返回出错
                print(error.debugDescription)
            } else {
                
                //返回成功
                let str = String(data: data!, encoding: String.Encoding.utf8)
                
                
                if(str != nil){
                    let string  = str!.components(separatedBy: "{").last
                    let string1 = string!.components(separatedBy: "}").first
                    var channels = [Video]()
                    
                    let json = string1!.components(separatedBy: "@msgType0|\r\n")
                    for i in json{
                        var video = Video.init()
                        let data1 = i
                        let title = data1.components(separatedBy: "|").first!.components(separatedBy: "@name").last
                        let image = data1.components(separatedBy: "|@address").first!.components(separatedBy: "@image").last
                        let address = data1.components(separatedBy: "@address").last!.components(separatedBy: "|@number").first
                        let number = data1.components(separatedBy: "|@number").last!.components(separatedBy: "|").first
                        video.img = image!
                        video.address = address!
                        video.title = title!
                        video.number = number!
                        channels.append(video)
                    }
                    completionHandler(channels)
                }
                
                print(str ?? "error")
            }
            
        }
        dataTask.resume()
        
        
    }
    static func loadMyAnchors(url:String,completionHandler:@escaping (_ videos:[Video]) -> ()) {
        //创建会话对象
        let serUrl      = URL(string:url)
        let request     = URLRequest(url: serUrl!)

        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("textCache.txt")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        Alamofire.download(request, to: destination).downloadProgress { Progress in
            if Progress.isFinished{
                
            }
            }.responseData { data in
//                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//                let fileURL = documentsURL.appendingPathComponent("textCache.txt")
                let path:String = NSHomeDirectory() + "/Documents/textCache.txt"
                if FileManager.default.fileExists(atPath: path){
                    
                    do{
                        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
                        let str = try NSString(contentsOfFile: path,encoding: enc)
                        if(str != nil){
                            print(str)
                            
                            let string  = str.components(separatedBy: "{").last
                            let string1 = string!.components(separatedBy: "}").first
                            var channels = [Video]()
                            
                            let json = string1!.components(separatedBy: "@addurlhttp")
                            for i in json{
                                var video = Video.init()
                                let data1 = i
                                let title = data1.components(separatedBy: "@mc").last!.components(separatedBy: "|@tp").first
                                let image = data1.components(separatedBy: "|@dz").first!.components(separatedBy: "@tp").last
                                let address = data1.components(separatedBy: "|@dz").last!.components(separatedBy: "|@groupId").first
                                video.img = image!
                                video.address = address!
                                
                                
                                video.title = title!
                                channels.append(video)
                            }
                            completionHandler(channels);
                        }

                        }catch{
                        
                        
                        
                    }
                    
                }
                
                
        }
        
       
      
//        //设置访问方式为POST
//        //request.httpMethod = "GET"
//
//        //设置POST 内容
//        //        request.httpBody = getBody(params: params).data(using: String.Encoding.utf8)
//        //        let data = try JSONSerialization.data(withJSONObject: params, options: options)
//        //        request.httpBody = data;
//        //开始访问
//
//        let dataTask : URLSessionDataTask = session.dataTask(with: request) { (data, respones, error)  -> Void  in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6, execute: {
//                if(error != nil) {
//                    //返回出错
//                    print(error.debugDescription)
//                } else {
//
//                    //返回成功
//                    let str = String(data: data!, encoding: String.Encoding.utf8)
//
//
//                        completionHandler(channels)
//                    }
//
//                    print(str ?? "error")
//                }
//            })
//
//
//        }
//        dataTask.resume()
        
        
    }
    
    
    
}


struct NetworkTool:NetworkToolProtocol {
    
    
    
    
    
}
