//
//  LoginViewController.swift
//  Film App
//
//  Created by Himash Nadeeshan on 4/19/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var un: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 5

    }
    
    @IBAction func login(_ sender: Any) {
        
        if un.text == "abc" && pw.text == "123"{

            performSegue(withIdentifier: "gotohome", sender: nil)
            
        }else{
            
           let alert = UIAlertController(title: "Oops", message: "Username or Password is incorrect", preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
            
            un.text = ""
            pw.text = ""
            
        }
        
    }

}
