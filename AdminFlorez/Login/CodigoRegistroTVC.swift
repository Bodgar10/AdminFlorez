//
//  CodigoRegistroTVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 20/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
//import Firebase

class CodigoRegistroTVC: UITableViewController {

    let SEGUE_INFO = "info"
    
    @IBOutlet weak var codigo1TextField: UITextField!
    @IBOutlet weak var codigo2TextField: UITextField!
    @IBOutlet weak var codigo3TextField: UITextField!
    @IBOutlet weak var codigo4TextField: UITextField!
    @IBOutlet weak var codigo5TextField: UITextField!
    @IBOutlet weak var codigo6TextField: UITextField!
    @IBOutlet weak var labelPhone: UILabel!
    var phone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.codigo1TextField.delegate = self
        self.codigo1TextField.tag = 0
        self.codigo2TextField.delegate = self
        self.codigo2TextField.tag = 1
        self.codigo3TextField.delegate = self
        self.codigo3TextField.tag = 2
        self.codigo4TextField.delegate = self
        self.codigo4TextField.tag = 3
        self.codigo5TextField.delegate = self
        self.codigo5TextField.tag = 4
        self.codigo6TextField.delegate = self
        self.codigo6TextField.tag = 5
        self.hideKeyboardWhenTappingAround()
        self.labelPhone.text = "El código se envió al número: \(self.phone)"
        
        codigo1TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codigo2TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codigo3TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codigo4TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codigo5TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        codigo6TextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if (text?.utf16.count)! >= 1{
            switch textField{
            case codigo1TextField:
                codigo2TextField.becomeFirstResponder()
            case codigo2TextField:
                codigo3TextField.becomeFirstResponder()
            case codigo3TextField:
                codigo4TextField.becomeFirstResponder()
            case codigo4TextField:
                codigo5TextField.becomeFirstResponder()
            case codigo5TextField:
                codigo6TextField.becomeFirstResponder()
            default:
                break
            }
        }else{
            
        }
    }
    
    @IBAction func reenviarCodigoBtn(_ sender: UIButton) {
        print("PHONE: \(self.phone)")
        /*PhoneAuthProvider.provider().verifyPhoneNumber("\(self.phone)", uiDelegate: nil) { (verificacion, error) in
            if let error1 = error {
                self.alert(title: "Error", message: error1.localizedDescription)
            }else {
                let defaults = UserDefaults.standard
                defaults.set(verificacion, forKey: "auth")
                self.alert(title: "Código enviado", message: "Se volvió a reenviar el código a tu teléfono.")
            }
        }*/
    }
    
    @IBAction func continueBtn(_ sender: UIButton) {
        
        let codigo = self.codigo1TextField.text! + self.codigo2TextField.text! + self.codigo3TextField.text! + self.codigo4TextField.text! + self.codigo5TextField.text! + self.codigo6TextField.text!
        let defaults = UserDefaults.standard
        /*let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "auth")!, verificationCode: codigo)
        Auth.auth().signInAndRetrieveData(with: credential) { (user1, error) in
            if error != nil {
                
                print("ERROR: \(error!.localizedDescription)")
            }else{
                self.performSegue(withIdentifier: self.SEGUE_INFO, sender: self)
            }
        }*/
        self.performSegue(withIdentifier: self.SEGUE_INFO, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.SEGUE_INFO {
            let chosenPerson = segue.destination as! InfoAdicionalRegistroTVC
            chosenPerson.phone = self.phone
            //chosenPerson.phone = self.telefono
        }
    }
    
    @IBAction func returnBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CodigoRegistroTVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        
        return count <= 1
    }
}
