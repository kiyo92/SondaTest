//
//  BaseView.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import Foundation

@objc protocol BaseView: NSObjectProtocol {
    @objc optional func loading(show: Bool)

}
