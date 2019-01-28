
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

    ///平台数据
    static func loadMyChannels1_6(completionHandler: @escaping (_ videos: [MyChannel]) -> ())
    ///主播列表数据
    static func loadMyAnchors(param:Parameters,completionHandler:@escaping (_ videos:[Video]) -> ())
    
    ///kyj videos
    static func loadKYJVideos(page:NSInteger ,completionHandler: @escaping (_ videos: [InfoItem]) -> ())
    
    
}

extension NetworkToolProtocol{

    static func loadMyChannels1_6(completionHandler: @escaping (_ videos: [MyChannel]) -> ()) {
        
//        let url = "http://www.kandx.vip/mobile/live/index"

        let url = "http://p.59card.com/mobile/live/index"
        let header =  [
            "User-Agent":"okhttp/3.8.1",
            "token": "95c23bbbf17297c3b6e25f5edfa6ad77",
            "Content-Type": "application/json; charset=utf-8"
        ]
        Alamofire.request(url,method:.post, headers: header).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                if let datas = json["data"]["lists"].arrayObject {
                    completionHandler(datas.compactMap({ MyChannel.deserialize(from: $0 as? Dictionary) }))
                }
            }
        }
    }
    
    static func loadMyAnchors(param:Parameters,completionHandler:@escaping (_ videos:[Video]) -> ()){
//        let url = "http://www.kandx.vip/mobile/live/anchors"
        let url = "http://p.59card.com/mobile/live/anchors"
        let header =  [
            "User-Agent":"okhttp/3.8.1",
            "token": "95c23bbbf17297c3b6e25f5edfa6ad77",
            "Content-Type": "application/json; charset=utf-8"
        ]
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                if let datas = json["data"]["lists"].arrayObject {
                    completionHandler(datas.compactMap({ Video.deserialize(from: $0 as? Dictionary) }))
                }
            }
        }
    }
    
        ///kyj videos
    static func loadKYJVideos(page:NSInteger ,completionHandler: @escaping (_ videos: [InfoItem]) -> ()) {
        
        let url = "http://app.kyj344.com:8880/api/public/?service=Video.getRecommendVideos&uid=-9999&type=0&isstart=1&p=" + "\(page)"
        
        let header =  [
            "Content-Type": "application/x-www-form-urlencoded",
            "User-Agent": "iphoneLive/1.1 (iPhone; iOS 12.0; Scale/2.00)"
        ]
        Alamofire.request(url,method:.post, headers: header).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                if let datas = json["data"]["info"].arrayObject {
                    completionHandler(datas.compactMap({InfoItem.deserialize(from: $0 as? Dictionary) }))
                }
            }
        }
    }
//
//    static func loadMyChannels(url:String,completionHandler:@escaping (_ videos:[Video]) -> ()) {
//        //创建会话对象
//        let session     = URLSession.shared
//        let serUrl      = URL(string:url)
//        var request     = URLRequest(url: serUrl!)
//
//        //设置访问方式为POST
//        request.httpMethod = "GET"
//
//        //设置POST 内容
//        //        request.httpBody = getBody(params: params).data(using: String.Encoding.utf8)
//        //        let data = try JSONSerialization.data(withJSONObject: params, options: options)
//        //        request.httpBody = data;
//        //开始访问
//        let dataTask : URLSessionDataTask = session.dataTask(with: request) { (data, respones, error)  -> Void  in
//
//            //访问结束
//            if(error != nil) {
//                //返回出错
//                print(error.debugDescription)
//            } else {
//
//                //返回成功
//                let str = String(data: data!, encoding: String.Encoding.utf8)
//
//
//                if(str != nil){
//                    let string  = str!.components(separatedBy: "{").last
//                    let string1 = string!.components(separatedBy: "}").first
//                    var channels = [Video]()
//
//                    let json = string1!.components(separatedBy: "@msgType0|\r\n")
//                    for i in json{
//                        var video = Video.init()
//                        let data1 = i
//                        let title = data1.components(separatedBy: "|").first!.components(separatedBy: "@name").last
//                        let image = data1.components(separatedBy: "|@address").first!.components(separatedBy: "@image").last
//                        let address = data1.components(separatedBy: "@address").last!.components(separatedBy: "|@number").first
//                        let number = data1.components(separatedBy: "|@number").last!.components(separatedBy: "|").first
//                        video.img = image!
//                        video.address = address!
//                        video.title = title!
//                        video.number = number!
//                        channels.append(video)
//                    }
//                    completionHandler(channels)
//                }
//
//                print(str ?? "error")
//            }
//
//        }
//        dataTask.resume()
//
//
//    }
//    static func loadMyAnchors(url:String,completionHandler:@escaping (_ videos:[Video]) -> ()) {
//        //创建会话对象
//        let serUrl      = URL(string:url)
//        let request     = URLRequest(url: serUrl!)
//
//
//        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            let fileURL = documentsURL.appendingPathComponent("textCache.txt")
//
//            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
//        }
//        Alamofire.download(request, to: destination).downloadProgress { Progress in
//            if Progress.isFinished{
//
//            }
//            }.responseData { data in
////                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
////                let fileURL = documentsURL.appendingPathComponent("textCache.txt")
//                let path:String = NSHomeDirectory() + "/Documents/textCache.txt"
//                if FileManager.default.fileExists(atPath: path){
//
//                    do{
//                        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
//                        let str = try NSString(contentsOfFile: path,encoding: enc)
//                        if(str != nil){
//                            print(str)
//
//                            let string  = str.components(separatedBy: "{").last
//                            let string1 = string!.components(separatedBy: "}").first
//                            var channels = [Video]()
//
//                            let json = string1!.components(separatedBy: "@addurlhttp")
//                            for i in json{
//                                var video = Video.init()
//                                let data1 = i
//                                let title = data1.components(separatedBy: "@mc").last!.components(separatedBy: "|@tp").first
//                                let image = data1.components(separatedBy: "|@dz").first!.components(separatedBy: "@tp").last
//                                let address = data1.components(separatedBy: "|@dz").last!.components(separatedBy: "|@groupId").first
//                                video.img = image!
//                                video.address = address!
//
//
//                                video.title = title!
//                                channels.append(video)
//                            }
//                            completionHandler(channels);
//                        }
//
//                        }catch{
//
//
//
//                    }
//
//                }
//
//
//        }
//
//
//
////        //设置访问方式为POST
////        //request.httpMethod = "GET"
////
////        //设置POST 内容
////        //        request.httpBody = getBody(params: params).data(using: String.Encoding.utf8)
////        //        let data = try JSONSerialization.data(withJSONObject: params, options: options)
////        //        request.httpBody = data;
////        //开始访问
////
////        let dataTask : URLSessionDataTask = session.dataTask(with: request) { (data, respones, error)  -> Void  in
////            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6, execute: {
////                if(error != nil) {
////                    //返回出错
////                    print(error.debugDescription)
////                } else {
////
////                    //返回成功
////                    let str = String(data: data!, encoding: String.Encoding.utf8)
////
////
////                        completionHandler(channels)
////                    }
////
////                    print(str ?? "error")
////                }
////            })
////
////
////        }
////        dataTask.resume()
//
//
//    }
//
    
    
}


struct NetworkTool:NetworkToolProtocol {
    
    
    
    
    
}
