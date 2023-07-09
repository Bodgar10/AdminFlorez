//
//  InfoAdicionalRegistroTVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 20/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
/*import Firebase
import NVActivityIndicatorView*/

class InfoAdicionalRegistroTVC: UITableViewController {

    @IBOutlet weak var nameCompletoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    let SEGUE_METODO = "metodo"
    //var activityIndicator: NVActivityIndicatorView!
    var phone = String()
    var token = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameCompletoTextField.delegate = self
        self.emailTextField.delegate = self
        self.passTextField.delegate = self
        self.confirmPassTextField.delegate = self
        self.hideKeyboardWhenTappingAround()
        
        
        /*if let tok = InstanceID.instanceID().token() {
            self.token = tok
        }*/
    }

    @IBAction func registrarteBtn(_ sender: UIButton) {
        if self.nameCompletoTextField.text == "" || self.emailTextField.text == "" || self.passTextField.text == "" || self.confirmPassTextField.text == "" {
            self.alert(title: "Faltan datos", message: "Por favor, verifica que tengas todo escrito.")
        }else if let name = self.nameCompletoTextField.text, let email = self.emailTextField.text, let pass = self.passTextField.text, let confirm = self.confirmPassTextField.text{
            /*SubirInfo.Instance.crearUsuario(tipo: Constantes.USER, telefono: self.phone, nombre: name, correo: email, contrasena: pass, id_metodo: "nil", foto: "nil", identificacion: "nil", licencia: "nil", tipo_navegacion: "nil", id_user: Auth.auth().currentUser!.uid, token: self.token, status: Constantes.DISPONIBLE, codigo: BajarInfo.Instance.randomString(length: 6))*/
            self.performSegue(withIdentifier: self.SEGUE_METODO, sender: nil)
        }
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
    
    @IBAction func nameAction(_ sender: UITextField) {
        self.nameCompletoTextField.layer.borderColor = #colorLiteral(red: 0.8117647059, green: 0.4274509804, blue: 0.6117647059, alpha: 1)
        var leftViewMode = UITextField.ViewMode.always
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "nombre-icono")
        self.nameCompletoTextField.leftView = imageView
        self.nameCompletoTextField.leftViewMode = leftViewMode
        
        self.emailTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "email-icono")
        self.emailTextField.leftView = imageView
        self.emailTextField.leftViewMode = leftViewMode
        
        self.passTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.passTextField.leftView = imageView
        self.passTextField.leftViewMode = leftViewMode
        
        self.confirmPassTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.confirmPassTextField.leftView = imageView
        self.confirmPassTextField.leftViewMode = leftViewMode
    }
    
    @IBAction func emailAction(_ sender: UITextField) {
        self.nameCompletoTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        var leftViewMode = UITextField.ViewMode.always
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "nombre-icono_2")
        self.nameCompletoTextField.leftView = imageView
        self.nameCompletoTextField.leftViewMode = leftViewMode
        
        self.passTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.passTextField.leftView = imageView
        self.passTextField.leftViewMode = leftViewMode
        
        self.confirmPassTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.confirmPassTextField.leftView = imageView
        self.confirmPassTextField.leftViewMode = leftViewMode
        
        self.emailTextField.layer.borderColor = #colorLiteral(red: 0.8117647059, green: 0.4274509804, blue: 0.6117647059, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "icoMail")
        self.emailTextField.leftView = imageView
        self.emailTextField.leftViewMode = leftViewMode
    }
    
    @IBAction func passAction(_ sender: UITextField) {
        self.nameCompletoTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        var leftViewMode = UITextField.ViewMode.always
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "nombre-icono_2")
        self.nameCompletoTextField.leftView = imageView
        self.nameCompletoTextField.leftViewMode = leftViewMode
        
        self.emailTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "email-icono")
        self.emailTextField.leftView = imageView
        self.emailTextField.leftViewMode = leftViewMode
        
        self.confirmPassTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.confirmPassTextField.leftView = imageView
        self.confirmPassTextField.leftViewMode = leftViewMode
        
        self.passTextField.layer.borderColor = #colorLiteral(red: 0.8117647059, green: 0.4274509804, blue: 0.6117647059, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena_icono_seleccionado")
        self.passTextField.leftView = imageView
        self.passTextField.leftViewMode = leftViewMode
    }
    
    @IBAction func passConfirmAction(_ sender: UITextField) {
        self.nameCompletoTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        var leftViewMode = UITextField.ViewMode.always
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "nombre-icono_2")
        self.nameCompletoTextField.leftView = imageView
        self.nameCompletoTextField.leftViewMode = leftViewMode
        
        self.emailTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "email-icono")
        self.emailTextField.leftView = imageView
        self.emailTextField.leftViewMode = leftViewMode
        
        self.passTextField.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena-icono")
        self.passTextField.leftView = imageView
        self.passTextField.leftViewMode = leftViewMode
        
        self.confirmPassTextField.layer.borderColor = #colorLiteral(red: 0.8117647059, green: 0.4274509804, blue: 0.6117647059, alpha: 1)
        leftViewMode = UITextField.ViewMode.always
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "contrasena_icono_seleccionado")
        self.confirmPassTextField.leftView = imageView
        self.confirmPassTextField.leftViewMode = leftViewMode
    }
}

extension InfoAdicionalRegistroTVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
