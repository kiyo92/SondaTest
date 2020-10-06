//
//  PhotoCollectionViewCell.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit
import Alamofire
class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var view: UIView!
    @IBOutlet var photoImg: UIImageView!
    var service: AlamofireService = RestClient()
    func setCellData(photo: Photo) -> Void {
        //self.photoImg = UIImageView();
        
        Alamofire.request(photo.url!, method: .get)
        .validate()
        .responseData(completionHandler: { (responseData) in
            self.photoImg.image = UIImage(data: responseData.data!)
            
        })
        
        
        
    }
}
