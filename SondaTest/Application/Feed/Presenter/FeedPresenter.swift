//
//  FeedPresenter.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

class FeedPresenter: BasePresenter {
    weak private var view : FeedView?
    
    var service: AlamofireService = RestClient()
    func attach(view: NSObjectProtocol){
        self.view = view as? FeedView
    }
    
    func detach() {
        view = nil
    }
    
    func getPhotos() {
        //self.view!.loading!(show: true)
        let url = SessionManager.PHOTOS

        self.service.GET(url: url, completionHandler: { (data, statusCode ,success) -> Void in
            //self.view!.loading!(show: false)
            
            if success {
                if statusCode == 401 {
                    //caso utilize autenticação
                    return
                }
                
                let photos = Photo.getAlbumFrom(responseJSON: data!)
                //print(photos)
                self.view?.feedAPIResponse(photos: photos)
            } else {
                print("erro")
            }
        })
    }
}
