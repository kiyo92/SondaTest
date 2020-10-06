//
//  AlamofireService.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import Alamofire

protocol AlamofireService {
    
    func GET(url: String, headers: HTTPHeaders, completionHandler: @escaping (_ responseJSON: Data?, _ success: Bool) -> Void) -> Void
    
    func GET(url: String, completionHandler: @escaping (_ responseJSON: Data?, _ success: Bool) -> Void) -> Void
    
    func GET(url: String, completionHandler: @escaping (_ responseJSON: Data?, _ statusCode: Int?, _ success: Bool) -> Void) -> Void
    
    func POST(url: String, _ params: Parameters, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
    
    func POST(url: String, headers: HTTPHeaders, _ params: Parameters, completionHandler: @escaping (_ responseJSON: Data?, _ statusCode: Int?, _ success: Bool) -> Void) -> Void
    
    func POST(url: String, _ params: Parameters, fileParam: String, fileData: Data, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
    
    func PUT(url: String, headers: HTTPHeaders, _ params: Parameters, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
    
    func PUT(url: String, headers: HTTPHeaders, _ params: Parameters, fileParam: String, fileData: Data, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
    
    func PATCH(url: String, _ params: Parameters, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
    
    func DELETE(url: String, headers: HTTPHeaders, completionHandler: @escaping (_ responseJSON: Data?, _ message: AnyObject?, _ success: Bool) -> Void) -> Void
}
