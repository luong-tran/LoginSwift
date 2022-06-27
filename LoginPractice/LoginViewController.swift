//
//  LoginViewController.swift
//  LoginPractice
//
//  Created by LuongTran on 25/06/2022.
//

import UIKit



class LoginViewController: UIViewController {

    //button
    @IBOutlet weak var btnLogin: UIButton!
    //textfield
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    //lable
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var lblForgotPass: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblError: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customStyle()
        lblError.isHidden = true
    }
    @IBAction func btnLogin(_ sender: Any) {
        
        checkNullLogin()
    }
    
    func checkNullLogin(){
        
        let username = "luongtran"
        let password = "123456"
        
        if(tfUser.text!.isEmpty && tfPass.text!.isEmpty){
            lblError.isHidden = false
            lblError.text = "Username and password null"
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
            
        }else if(tfUser.text!.isEmpty){
            lblError.isHidden = false
            lblError.text = "Username null"
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else if(tfPass.text!.isEmpty){
            lblError.isHidden = false
            lblError.text = "Password null"
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else{
            if(tfUser.text?.trimmingCharacters(in: .whitespaces) == username
               && tfPass.text?.trimmingCharacters(in: .whitespaces) == password){
                lblError.isHidden = false
                lblError.text = "Loading..."
                let deadlineTime = DispatchTime.now() + .seconds(1)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    self.lblError.isHidden = true
                    
                    UserDefaults.standard.set(username, forKey: "username")
                    
                    let homeViewController = HomeViewController()
                    homeViewController.tokenUser = username
                    UIApplication.shared.delegate?.window??.rootViewController = homeViewController
                }
                
            }else if (tfUser.text?.trimmingCharacters(in: .whitespaces) != username){
                lblError.isHidden = false
                lblError.text = "Username wrong"
                let deadlineTime = DispatchTime.now() + .seconds(3)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    self.lblError.isHidden = true
                }
            }else if (tfPass.text?.trimmingCharacters(in: .whitespaces) != password){
                lblError.isHidden = false
                lblError.text = "Password wrong"
                let deadlineTime = DispatchTime.now() + .seconds(3)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    self.lblError.isHidden = true
                }
            }
                checkLengthPassword()
        }
    }
    
    func checkLengthPassword(){
        if(tfPass.text!.count < 6 && tfPass.text!.count >= 1){
            lblError.isHidden = false
            lblError.text = "Password too short"
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else if(tfPass.text!.contains(" ")){
            lblError.isHidden = false
            lblError.text = "Password contains whitespace"
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }
    }
    
    func customStyle(){
        let borderBot = CALayer()
        borderBot.backgroundColor = UIColor.tintColor.cgColor
        borderBot.frame = CGRect(x: 0, y: self.lblHome.frame.size.height - 2.0, width: self.lblHome.frame.size.width, height: 2.0)
        lblHome.layer.addSublayer(borderBot)
        
        //hide pass
        tfPass.isSecureTextEntry = true
        
        //border TextField
        tfUser.layer.borderWidth = 1.0
        tfUser.layer.borderColor = UIColor.tintColor.cgColor
        tfUser.layer.cornerRadius = 5.0
        tfPass.layer.borderWidth = 1.0
        tfPass.layer.borderColor = UIColor.tintColor.cgColor
        tfPass.layer.cornerRadius = 5.0
        
        //button
        btnLogin.layer.backgroundColor = UIColor.tintColor.cgColor
        btnLogin.layer.cornerRadius = 5.0
        
        //underline Label
        let textNewAccount = "Create new account"
        let textForgotPass = "Forgot password?"
        let textColor: UIColor = .tintColor
        let underLineColor: UIColor = .tintColor
        let underLineStyle = NSUnderlineStyle.single.rawValue

        let labelAtributes:[NSAttributedString.Key : Any]  = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.underlineStyle: underLineStyle,
            NSAttributedString.Key.underlineColor: underLineColor
        ]

        let underlineAttributedString = NSAttributedString(string: textNewAccount,
                                                                   attributes: labelAtributes)
        let underForgotPass = NSAttributedString(string: textForgotPass,
                                                 attributes: labelAtributes)

        lblCreateAccount.attributedText = underlineAttributedString
        lblForgotPass.attributedText = underForgotPass
        
        
    }


}
