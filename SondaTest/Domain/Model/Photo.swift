//
//  Photo.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photo : Mappable{
    var title: String?
    var url: String?
    
    init() {}
    
    init?(map: Map) {}

    mutating func mapping(map: Map) {

        title                <- map["title"]
        url  <- map["url"]
    }
}

extension Photo {
    
    public static func getAlbumFrom(responseJSON: Data) -> [Photo] {

        var object: [Photo] = []
        do {
            if let jsonData = try JSONSerialization.jsonObject(with: responseJSON, options: JSONSerialization.ReadingOptions()) as? NSObject {
                let photos = Mapper<Photo>().mapArray(JSONArray: jsonData as! [[String : Any]])
                object = photos
                
            }
        } catch _ {
        }
        return object
    }
    
    
}
