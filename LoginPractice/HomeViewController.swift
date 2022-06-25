//
//  HomeViewController.swift
//  LoginPractice
//
//  Created by LuongTran on 26/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblLogout: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customStyle()
        addEvent()
    }

    func customStyle(){
        let borderBot = CALayer()
        borderBot.backgroundColor = UIColor.tintColor.cgColor
        borderBot.frame = CGRect(x: 0, y: self.lblHome.frame.size.height - 2.0, width: self.lblHome.frame.size.width, height: 2.0)
        lblHome.layer.addSublayer(borderBot)
        
        lblWelcome.text = "Welcome <" + tokenUser.uppercased() + ">"
    }
    
    func addEvent(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.tapFunction))
                lblLogout.isUserInteractionEnabled = true
                lblLogout.addGestureRecognizer(tap)
    }
    
    @objc
        func tapFunction(sender:UITapGestureRecognizer) {
            let loginViewController = LoginViewController()
            UIApplication.shared.delegate?.window??.rootViewController = loginViewController
            tokenUser = ""
        }
}
