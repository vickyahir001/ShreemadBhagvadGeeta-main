//
//  SignUpAccount.swift
//  ShreemadBhagvadGeeta
//
//  Created by Frontlink Tech on 26/12/23.
//

import UIKit

class SignUpAccount: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        if emailTxt.text == ""
        {
            showalert(title: "Enter your E-mail")
        }
        else if  passwordTxt.text?.count != 8
        {
            showalert(title: "Enter Password in 8 digit")
        }
        else
        {
            let navigation = storyboard?.instantiateViewController(identifier: "BhagdaxGeetaIndex") as! BhagdaxGeetaIndex
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    func showalert(title : String)
    {
        let alert = UIAlertController(title: "Enter Your Details", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert,animated: true)
    }
    func setProperty()
    {
        emailTxt.layer.borderColor = UIColor.black.cgColor
        emailTxt.layer.borderWidth = 1
        emailTxt.layer.cornerRadius = 10
        passwordTxt.layer.borderColor = UIColor.black.cgColor
        passwordTxt.layer.borderWidth = 1
        passwordTxt.layer.cornerRadius = 10
        signUpButton.layer.cornerRadius = 20
        emailTxt.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTxt.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
}
