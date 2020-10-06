//
//  SettingsViewController.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onExitClicked(_ sender: Any) {
        // Alerta
        let dialogMessage = UIAlertController(title: "Atencão", message: "Deseja encerrar a sessão no aplicativo?", preferredStyle: .alert)
        
        // Botoes do alerta
        let optionStay = UIAlertAction(title: "Não", style: .default, handler: nil)
        let optionExit = UIAlertAction(title: "Sim", style: .default, handler: { (action) -> Void in
           UserStorage.clearUserSession()

           let controller = UIStoryboard.buildLoginViewController()
           controller.modalPresentationStyle = UIModalPresentationStyle.fullScreen
           controller.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
           self.present(controller, animated: true, completion: nil)
        })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(optionStay)
        dialogMessage.addAction(optionExit)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}
