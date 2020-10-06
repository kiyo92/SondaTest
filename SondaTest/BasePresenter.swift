//
//  BasePresenter.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

@objc protocol BasePresenter {
    @objc optional func attach(view: NSObjectProtocol)
    @objc optional func detach()
    @objc optional func getAppToken(fields: [String : String])
}
