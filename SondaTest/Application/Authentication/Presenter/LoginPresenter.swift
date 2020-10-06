//
//  LoginPresenter.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

class LoginPresenter: BasePresenter {
    
    weak private var view : LoginView?
    
    var service: AlamofireService = RestClient()
    
    func attach(view: NSObjectProtocol){
        self.view = view as? LoginView
    }
    
    func detach() {
        view = nil
    }
    
    
    func loginWith(email: String, password: String) {
        self.view!.loading!(show: true)
        
        let params = ["email": email,
                      "password": password] as [String : Any]
        
        let path = SessionManager.USERS
        let url = path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        service.POST(url: url, headers: ["Authorization": "null"], params, completionHandler: { (data, statusCode, success) -> Void in
            self.view!.loading!(show: false)
            if success {
                if statusCode == 401 {
                    //Se não existisse token
                    return
                }
                let user = User.getUserFrom(responseJSON: data!)
                if user.email.isEmpty {
                    //self.view!.showAlert?(title: "", message: ResponseMessage().getStatusMessageFrom(code: 401))
                    return
                }
                self.view!.confirmAPIResponse(user: user)
            } else {
                //self.view!.showAlert?(title: "", message: ResponseMessage().getStatusMessageFrom(code: statusCode!))
            }
        })
    }
}
