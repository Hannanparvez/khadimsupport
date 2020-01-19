//
//  ALIManager.swift
//  AvivaLifeInsurance
//
//  Created by sanjana on 13/06/15.
//  Copyright (c) 2015 SaraMobitech. All rights reserved.
//

import Foundation
import PassKit
import CoreLocation

// MARK: - ============================ALINetwork======================================
struct ALINetwork {
    
    enum Router: URLRequestConvertible {
        static let baseURLString = "http://103.25.172.118:8089/api/"
        static let GET_LOGIN = "CONFIGINFO?usercode=asm00006&password=123459&ismobile=1"
        static let GET_NEWS = ""
        
        
        case appVersion
        
        func asURLRequest() throws -> URLRequest {
            let (path, parameters, method): (String, [String:Any], HTTPMethod) = {
                
                switch self {
                case .appVersion:
                    let params = ["USERCODE" : "asm00006","PASSWORD": "123459","ismobile":"1"]
                    return(Router.GET_NEWS, params, .get)
                }
            }()
            
            let url = URL(string: Router.baseURLString)
            var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = 120
            
            let encoding = JSONEncoding.default
            
            if DEBUG.isDebuggingEnabled{
                print("Request_URL\(urlRequest)")
                print("Request_Parameters\(parameters)")
            }
         
            return try encoding.encode(urlRequest, with: parameters)
            
        }
    }
}

// MARK: - ============================ALIManager Class ================================

open class ALIManager: NSObject, CLLocationManagerDelegate {
   
    public static let sharedInstance: ALIManager = {
        return ALIManager()
    }()
    
    
    
    // MARK: - ==================Class Initialization==================
    func checkAppVersion(_ completionHandler: @escaping (_ status: Bool , _ object:NSDictionary) -> Void) {
    
      //  request(ALINetwork.Router.appVersion).responseJSON() { (JSON) -> Void in
            
       //     if DEBUG.isDebuggingEnabled{print("Check App Version Response :\(JSON)")}
            
       //     guard JSON.result.isSuccess else{
       //         completionHandler(false, [:]) //If error don't show alert
       //         return
      //      }
            
        //    let responseData1 = JSON.result.value as? NSDictionary
       //     let responseData2 = JSON.result.value as? NSArray

       //     print("respons data 1", responseData1)
      //      print("respons data 2", responseData2)
      //      completionHandler(true, responseData1!)
          //  completionHandler(true, responseData2!)

          //  let statusStr = responseData!["status#"] as! String
            
          //  if (statusStr == "1") {
          //      completionHandler(true, responseData!)
          //  }
            
            
            
           /* if let bodyDict = self.responseArrayBody(JSON.result.value as? NSDictionary) {
                
                let company_name = bodyDict["company_name"] as! String
                print(company_name)
                
                completionHandler(true, company_name)
                
            } else {
                completionHandler(false, [])
                //If not get anything from server consider current version as same version and don't show update alert
            }*/
        
    }
    

    func responseBody(_ JSON: NSDictionary?) -> NSDictionary? {
        
        if let responseDict = JSON  {
          //  let headerDict = responseDict["header"] as! NSDictionary
          //  let statusStr = headerDict["status#"] as! String
            
            let statusStr = responseDict["status#"] as! String
            
            if (statusStr == "1") {
                
                
                let body = responseDict["data#"] as! NSDictionary
                print(body)
                return (body)
               // let body = responseDict["Body"] as! NSDictionary
                //return (body)
            } else if (statusStr == "FALSE") {
              /*  let message = headerDict["Message"] as! String
                if (message == "Token has expired") {
                    NotificationCenter.default.post(name: Notification.Name.TaskName.TokenExpired, object:nil)
                }*/
            }
        }
        
        return nil
    }
    
    func responseArrayBody(_ JSON: NSDictionary?) -> NSArray? {
        
        if let responseDict = JSON  {
            //  let headerDict = responseDict["header"] as! NSDictionary
            //  let statusStr = headerDict["status#"] as! String
            
            let statusStr = responseDict["status#"] as! String
            
            if (statusStr == "1") {
                
                
                let body = responseDict["data#"] as! NSArray
                print(body)
                return (body)
                // let body = responseDict["Body"] as! NSDictionary
                //return (body)
            } else if (statusStr == "FALSE") {
                /*  let message = headerDict["Message"] as! String
                 if (message == "Token has expired") {
                 NotificationCenter.default.post(name: Notification.Name.TaskName.TokenExpired, object:nil)
                 }*/
            }
        }
        
        return nil
    }
    
}



