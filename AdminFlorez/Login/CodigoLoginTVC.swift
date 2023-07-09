//
//  CodigoLoginTVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 26/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
//import FirebaseAuth
//import Firebase
//import NVActivityIndicatorView

class CodigoLoginTVC: UITableViewController {

    let SEGUE_INICIO = "inicio"
    let SEGUE_ADMIN = "admin"
    let SEGUE_REPAR = "repar"
    
    @IBOutlet weak var codigo1TextField: UITextField!
    @IBOutlet weak var codigo2TextField: UITextField!
    @IBOutlet weak var codigo3TextField: UITextField!
    @IBOutlet weak var codigo4TextField: UITextField!
    @IBOutlet weak var codigo5TextField: UITextField!
    @IBOutlet weak var codigo6TextField: UITextField!
    @IBOutlet weak var labelPhone: UILabel!
    var phone = String()
    //var activityIndicator: NVActivityIndicatorView!
    
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        /*PhoneAuthProvider.provider().verifyPhoneNumber("\(phone)", uiDelegate: nil) { (verificacion, error) in
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
        //self.startActivityIndicator()
        let codigo = self.codigo1TextField.text! + self.codigo2TextField.text! + self.codigo3TextField.text! + self.codigo4TextField.text! + self.codigo5TextField.text! + self.codigo6TextField.text!
        let defaults = UserDefaults.standard
        let storyboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_ADMIN)
        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        vc.modalTransitionStyle = modalStyle
        self.present(vc, animated: true, completion: nil)
        
        //let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "auth")!, verificationCode: codigo)
        /*Auth.auth().signInAndRetrieveData(with: credential) { (user1, error) in
            if error != nil {
                print("ERROR: \(error!.localizedDescription)")
            }else{
                if let uid = Auth.auth().currentUser?.uid {
                    BajarInfo.Instance.bajarUsuarios { (usuario) in
                        
                        if usuario.codigo == "nil" {
                            BajarInfo.Instance.randomString(length: 6)
                        }
                        
                        if usuario.id_user == uid {
                            if usuario.tipo == Constantes.USER {
                                self.endActivityIndicator()
                                self.performSegue(withIdentifier: self.SEGUE_INICIO, sender: nil)
                            }else if usuario.tipo == Constantes.ADMIN {
                                self.endActivityIndicator()
                                let storyboard = UIStoryboard(name: "Admin", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_ADMIN)
                                let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
                                vc.modalTransitionStyle = modalStyle
                                self.present(vc, animated: true, completion: nil)
                            }else if usuario.tipo == Constantes.REPARTIDOR{
                                self.endActivityIndicator()
                                let storyboard = UIStoryboard(name: "Repar", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_REPAR)
                                let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
                                vc.modalTransitionStyle = modalStyle
                                self.present(vc, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }*/
    }
    
    @IBAction func returnBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*func startActivityIndicator() {
        
        self.activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.activityIndicator.center = self.view.center
        self.activityIndicator.type = NVActivityIndicatorType.ballPulseSync
        self.activityIndicator.color = #colorLiteral(red: 0.8392156863, green: 0.4196078431, blue: 0.6078431373, alpha: 1)
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    func endActivityIndicator() {
        
        self.activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }*/
    
}

extension CodigoLoginTVC: UITextFieldDelegate{
    
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
