//
//  RegisterViewController.swift
//  LoginPractice
//
//  Created by LuongTran on 02/07/2022.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblUsername: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblConfirmpass: UITextField!
    @IBOutlet weak var lblDate: UITextField!
    @IBOutlet weak var lblGender: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    let genders = ["Male", "Female", "Other"]
    let pickerView = UIPickerView()
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Register Account"
        navigationController?.addCustomBottomLine(color: UIColor.tintColor, height: 2)
        
        customStyle()
        addEvent()
        createDatePicker()
        createGenderPicker()
    }

    func customStyle(){
        //custom Image
        imgAvatar.layer.cornerRadius = imgAvatar.frame.width / 2
        imgAvatar.clipsToBounds = true
        
        //border Textfield
        lblUsername.layer.borderWidth = 1.0
        lblUsername.layer.borderColor = UIColor.tintColor.cgColor
        lblUsername.layer.cornerRadius = 5.0
        
        lblPassword.layer.borderWidth = 1.0
        lblPassword.layer.borderColor = UIColor.tintColor.cgColor
        lblPassword.layer.cornerRadius = 5.0
        
        lblEmail.layer.borderWidth = 1.0
        lblEmail.layer.borderColor = UIColor.tintColor.cgColor
        lblEmail.layer.cornerRadius = 5.0
        
        lblConfirmpass.layer.borderWidth = 1.0
        lblConfirmpass.layer.borderColor = UIColor.tintColor.cgColor
        lblConfirmpass.layer.cornerRadius = 5.0
        
        lblDate.layer.borderWidth = 1.0
        lblDate.layer.borderColor = UIColor.tintColor.cgColor
        lblDate.layer.cornerRadius = 5.0
        
        lblGender.layer.borderWidth = 1.0
        lblGender.layer.borderColor = UIColor.tintColor.cgColor
        lblGender.layer.cornerRadius = 5.0
        
        lblError.isHidden = true
        
        //button
        btnRegister.layer.backgroundColor = UIColor.tintColor.cgColor
        btnRegister.layer.cornerRadius = 5.0
        
        //Pass
        lblPassword.isSecureTextEntry = true
        lblConfirmpass.isSecureTextEntry = true
    }
    
    func addEvent(){
        //tap
        let tapImgAvatar = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.tapChooseImage))
        imgAvatar.isUserInteractionEnabled = true
        imgAvatar.addGestureRecognizer(tapImgAvatar)
    }
 
    @objc func tapChooseImage(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imgAvatar.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerAccount(_ sender: Any) {
        checkTextfield()
    }
    
    func checkTextfield(){
        var email: Bool = false
        var username: Bool = false
        var password: Bool = false
        var confirmPass: Bool = false
        var dateOfBirth: Bool = false
        var gender: Bool = false
        
        //Email
        if (lblEmail.text!.isEmpty && lblEmail.text?.isValidEmail() == false){
            self.lblEmail.attributedPlaceholder = NSAttributedString(
                string: "Invalid Email",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblEmail.attributedPlaceholder = NSAttributedString(
                    string: "email",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else{
            email = true
        }
        //Username
        if (lblUsername.text!.isEmpty){
            self.lblUsername.attributedPlaceholder = NSAttributedString(
                string: "Username null",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblUsername.attributedPlaceholder = NSAttributedString(
                    string: "username",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else if (lblUsername.text!.count < 6){
            lblError.isHidden = false
            lblError.text = "Username too short"
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else if (lblUsername.text!.count > 32){
            lblError.isHidden = false
            lblError.text = "Username too long"
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else{
            username = true
        }
        //Password
        if (lblPassword.text!.isEmpty){
            self.lblPassword.attributedPlaceholder = NSAttributedString(
                string: "Password null",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblPassword.attributedPlaceholder = NSAttributedString(
                    string: "password",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else if (lblPassword.text!.count < 6){
            lblError.isHidden = false
            lblError.text = "Password too short"
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else if (lblPassword.text!.count > 32){
            lblError.isHidden = false
            lblError.text = "Password too long"
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else{
            password = true
        }
        //Confirm Password
        if(lblPassword.text != lblConfirmpass.text){
            lblError.isHidden = false
            lblError.text = "Password don't match"
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblError.isHidden = true
            }
        }else if(lblConfirmpass.text!.isEmpty){
            self.lblConfirmpass.attributedPlaceholder = NSAttributedString(
                string: "Confirm Password null",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblConfirmpass.attributedPlaceholder = NSAttributedString(
                    string: "confirm password",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else{
            confirmPass = true
        }
        //Date
        if(lblDate.text!.isEmpty){
            self.lblDate.attributedPlaceholder = NSAttributedString(
                string: "Date null",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblDate.attributedPlaceholder = NSAttributedString(
                    string: "date of birth",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else{
            dateOfBirth = true
        }
        //Gender
        if(lblGender.text!.isEmpty){
            self.lblGender.attributedPlaceholder = NSAttributedString(
                string: "Gender null",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.lblGender.attributedPlaceholder = NSAttributedString(
                    string: "gender",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
                )
            }
        }else{
            gender = true
        }
        //Check All
        if(email == true && username == true && password == true && confirmPass == true && dateOfBirth == true && gender == true){
            UserDefaults.standard.set(lblUsername.text, forKey: "username")
            
            let homeViewController = HomeViewController()
            homeViewController.tokenUser = lblUsername.text!
            UIApplication.shared.delegate?.window??.rootViewController = homeViewController
        }
    }
    
    //create Date Picker
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBirth))
        toolbar.setItems([doneBtn], animated: true)
        
        
        //assign toolbar
        lblDate.inputAccessoryView = toolbar
        
        //assign picker to the textfield
        lblDate.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
    }
    
    @objc func doneBirth(){
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        lblDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    //create Picker Gender
    func createGenderPicker(){
        pickerView.delegate = self
        pickerView.dataSource = self
        
        lblGender.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblGender.text = genders[row]
        lblGender.resignFirstResponder()
    }
}



