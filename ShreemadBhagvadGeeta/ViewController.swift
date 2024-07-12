//
//  ViewController.swift
//  ShreemadBhagvadGeeta
//
//  Created by vivek katariya on 26/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }

    func setProperty()
    {
        emailTxt.layer.borderColor = UIColor.black.cgColor
        emailTxt.layer.borderWidth = 1
        emailTxt.layer.cornerRadius = 10
        passwordTxt.layer.borderColor = UIColor.black.cgColor
        passwordTxt.layer.borderWidth = 1
        passwordTxt.layer.cornerRadius = 10
        logInButton.layer.cornerRadius = 20
        emailTxt.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTxt.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if emailTxt.text == ""
        {
            showalert(title: "Enter Your E-mail")
        }
        else if passwordTxt.text?.count != 8
        {
            showalert(title: "Enter Password in 8 digit")
        }
        else
        {
            let navigation = storyboard?.instantiateViewController(identifier: "BhagdaxGeetaIndex") as! BhagdaxGeetaIndex
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
  
        navigationController?.pushViewController(navigation, animated: true)
    }
    func showalert(title : String)
    {
        let alert = UIAlertController(title: "Enter Your Details", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }

}

