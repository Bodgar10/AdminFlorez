//
//  AddTarjetaVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 20/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
//import Firebase
//import NVActivityIndicatorView

class AddTarjetaVC: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var numTareaTextField: UITextField!
    @IBOutlet weak var mesTextField: UITextField!
    @IBOutlet weak var anioTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    
    let SEGUE_INICIO = "inicio"
    
    //var activityIndicator: NVActivityIndicatorView!
    
    //let conekta = Conekta()
    
    var terminacion = String()
    var selectedDay: String?
    
    var name = String()
    var email = String()
    var phone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*conekta.delegate = self
        conekta.publicKey = "key_CWqJ7XvCSQwPzsN2ahtQ8Qw"
        
        
        conekta.collectDevice()
        
        self.createDayPicker()
        self.createToolbar()*/
        
        self.nombreTextField.delegate = self
        self.numTareaTextField.delegate = self
        self.mesTextField.delegate = self
        self.anioTextField.delegate = self
        self.cvvTextField.delegate = self
        
        self.email = "prueba@gmail.com"
        self.phone = "5534928172"
        
        /*BajarInfo.Instance.bajarUsuarios { (usuario) in
            if usuario.id_user == Auth.auth().currentUser!.uid {
                self.email = usuario.email
                self.phone = usuario.phone
            }
        }*/
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTarjetaBtn(_ sender: UIButton) {
        if self.nombreTextField.text == "" || self.numTareaTextField.text == "" || self.mesTextField.text == "" || self.anioTextField.text == "" || self.cvvTextField.text == "" {
            self.alert(title: "Faltan datos", message: "Revisa que tengas todo completado")
        }else if let name = self.nombreTextField.text, let tarjeta = self.numTareaTextField.text, let mes = mesTextField.text, let anio = self.anioTextField.text, let cvv = self.cvvTextField.text{
            /*self.startActivityIndicator()
            let card = conekta.card()
            
            let last4 = String(tarjeta.suffix(4))
            
            self.terminacion = last4
            
            card?.setNumber(tarjeta, name: name, cvc: cvv, expMonth: mes, expYear: anio)
            
            let token = conekta.token()
            
            token?.card = card
            
            token?.create(success: { (data) -> Void in
                print(data)
                
                if let token = data?[AnyHashable("id")] {
                    print("TOKEN: \(token)")
                    
                    self.createUser(name: name, email: self.email, phone: self.phone, token: token as! String)
                }else {
                    self.endActivityIndicator()
                    self.alert(title: "ERROR", message: "Revisa si la tarjeta es correcta")
                }
                
            }, andError: { (error) -> Void in
                print(error)
            })*/
        }
    }
    
    func createUser(name: String, email: String, phone: String, token: String){
        var url = String()
        
        //url = Constantes.CREATE_COSTUMER+"name=\(name)&email=\(email)&phone=\(phone)&token=\(token)"
        
        let newUrl = url.replacingOccurrences(of: "", with: "%20", options: .literal, range: nil)
        let urlSTR = newUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print("")
        print("")
        print("")
        print("")
        print("")
        print("URL: \(urlSTR!)")
        print("")
        print("")
        print("")
        print("")
        print("")
        if let requestURL =  NSURL(string: urlSTR!) {
            var request = URLRequest(url: requestURL as URL)
            request.httpMethod = "GET"
            print("ENTRAMOS AQUI")
            DispatchQueue.global(qos: .background).async {
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if error != nil {
                        print("")
                        print("")
                        print("")
                        print("TE ERROR IS: \(error!.localizedDescription)")
                        print("")
                        print("")
                        print("")
                    }
                    let when = DispatchTime.now() + 2
                    DispatchQueue.main.asyncAfter(deadline: when, execute: {
                        print("YA ESTAMOS DENTRO")
                        do {
                            let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            if let parseJSON = myJSON {
                                //var msg: String!
                                if let id_metodo = parseJSON["id"] as? String {
                                    //self.endActivityIndicator()
                                    //SubirInfo.Instance.createTarjeta(id_tarjeta: id_metodo, id_usuario: Auth.auth().currentUser!.uid, terminacion: self.terminacion)
                                    self.performSegue(withIdentifier: self.SEGUE_INICIO, sender: self)
                                }else{
                                    //self.endActivityIndicator()
                                    self.alert(title: "ERROR", message: "Revisa si la tarjeta es correcta")
                                }
                                print("")
                                print("")
                                print("")
                                print("PARSE: \(parseJSON)")
                                print("")
                                print("")
                                print("")
                                /*let server = parseJSON["server"] as? String
                                 print("MSG AGENDA: \(msg)")
                                 msg = server*/
                            }
                        }catch {
                            print("ERROR: \(error.localizedDescription)")
                        }
                    })
                }
                task.resume()
            }
        }
    }
    
    @IBAction func returnBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createDayPicker() {
        
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        self.mesTextField.inputView = dayPicker
        self.anioTextField.inputView = dayPicker
        
        //Customizations
        dayPicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = #colorLiteral(red: 0.8976111495, green: 0.4488055747, blue: 0.6587903853, alpha: 1)
        toolBar.tintColor = .black
        
        let doneButton = UIBarButtonItem(title: "Elegir", style: .plain, target: self, action: #selector(AddTarjetaVC.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.mesTextField.inputAccessoryView = toolBar
        self.anioTextField.inputAccessoryView = toolBar
    }
    
    override func dismissKeyboard() {
        view.endEditing(true)
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

extension AddTarjetaVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddTarjetaVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.anioTextField.isEditing {
            return Constantes.ANIOS.count
        }else {
            return Constantes.MESES.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.anioTextField.isEditing {
            return Constantes.ANIOS[row]
        }else {
            return Constantes.MESES[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.anioTextField.isEditing {
            selectedDay = Constantes.ANIOS[row]
            self.anioTextField.text = "\(selectedDay!)"
        }else{
            selectedDay = Constantes.MESES[row]
            self.mesTextField.text = "\(selectedDay!)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 25)
        
        if self.anioTextField.isEditing {
            label.text = Constantes.ANIOS[row]
        }else{
            label.text = Constantes.MESES[row]
        }
        
        return label
    }
    
}
