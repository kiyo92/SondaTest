//
//  RestClient.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire

class RestClient: AlamofireService {
    
    func GET(url: String, headers: HTTPHeaders, completionHandler: @escaping (Data?, Bool) -> Void) {
        SessionManager.getSession().request(url, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, true)
            case .failure( _):
                completionHandler(response.data, false)
            }
        }
    }
    
    func GET(url: String, completionHandler: @escaping (Data?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, true)
            case .failure( _):
                completionHandler(response.data, false)
            }
        }
    }
    
    func GET(url: String, completionHandler: @escaping (Data?, Int? , Bool) -> Void) {
        SessionManager.getSession().request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, response.response?.statusCode,true)
            case .failure( _):
                completionHandler(response.data, response.response?.statusCode,false)
            }
        }
    }
    
    func POST(url: String, _ params: Parameters, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .post, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, "" as AnyObject, true)
            case .failure( _):
                completionHandler(response.data, response.error.debugDescription as AnyObject, false)
            }
        }
    }
    
    func POST(url: String, headers: HTTPHeaders, _ params: Parameters, completionHandler: @escaping (Data?, Int?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, response.response?.statusCode, true)
            case .failure( _):
                completionHandler(response.data, response.response?.statusCode, false)
            }
        }
    }
    
    func POST(url: String, _ params: Parameters, fileParam: String, fileData: Data, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().upload(multipartFormData: { multipart in
            
            multipart.append(fileData, withName: fileParam, fileName: "user.jpg", mimeType: "image/jpg")
            for (key, value) in params {
                multipart.append((value as! String).data(using: .utf8)!, withName: key)
            }
            
        }, to: url, method: .post) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.response { answer in
                    completionHandler(answer.data, "" as AnyObject, true)
                }
                upload.uploadProgress { progress in
                    //call progress callback here if needed
                }
            case .failure(let encodingError):
                completionHandler(nil, encodingError.localizedDescription as AnyObject, false)
            }
        }
    }
    
    func PUT(url: String, headers: HTTPHeaders, _ params: Parameters, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .put, parameters: params, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, "" as AnyObject, true)
            case .failure( _):
                completionHandler(response.data, response.error.debugDescription as AnyObject, false)
            }
        }
    }
    
    func PUT(url: String, headers: HTTPHeaders, _ params: Parameters, fileParam: String, fileData: Data, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().upload(multipartFormData: { multipart in
            
            multipart.append(fileData, withName: fileParam, fileName: "user.jpg", mimeType: "image/jpg")
            for (key, value) in params {
                multipart.append((value as! String).data(using: .utf8)!, withName: key)
            }
            
        }, to: url, method: .put, headers: headers) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.response { answer in
                    completionHandler(answer.data, "" as AnyObject, true)
                }
                upload.uploadProgress { progress in
                    //call progress callback here if needed
                }
            case .failure(let encodingError):
                completionHandler(nil, encodingError.localizedDescription as AnyObject, false)
            }
        }
    }
    
    func PATCH(url: String, _ params: Parameters, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .patch, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, "" as AnyObject, true)
            case .failure( _):
                completionHandler(response.data, response.error.debugDescription as AnyObject, false)
            }
        }
    }
    
    func DELETE(url: String, headers: HTTPHeaders, completionHandler: @escaping (Data?, AnyObject?, Bool) -> Void) {
        SessionManager.getSession().request(url, method: .delete, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.data, "" as AnyObject, true)
            case .failure( _):
                completionHandler(response.data, response.error.debugDescription as AnyObject, false)
            }
        }
    }
}
