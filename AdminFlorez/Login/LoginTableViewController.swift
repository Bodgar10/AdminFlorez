//
//  LoginTableViewController.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 26/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
import MapKit
//import GoogleMaps
import CoreLocation
/*import Firebase
import FBSDKLoginKit
import NVActivityIndicatorView*/

class LoginTableViewController: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var telefonoTextField: UITextField!
    
    //var activityIndicator: NVActivityIndicatorView!
    let SEGUE_CODIGO = "cupon"
    var telefono = String()
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.telefonoTextField.delegate = self
        self.hideKeyboardWhenTappingAround()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func siguienteBtn(_ sender: UIButton) {
        if self.telefonoTextField.text == "" {
            self.alert(title: "Falta teléfono", message: "Te falta escribir un teléfono")
        }else if let phone = self.telefonoTextField.text {
            self.telefono = "+52\(phone)"
            //let defaults = UserDefaults.standard
            //defaults.set(verificacion, forKey: "auth")
            
            self.performSegue(withIdentifier: self.SEGUE_CODIGO, sender: self)
            /*self.startActivityIndicator()
            PhoneAuthProvider.provider().verifyPhoneNumber("+52\(phone)", uiDelegate: nil) { (verificacion, error) in
                self.endActivityIndicator()
                if let error1 = error {
                    self.alert(title: "Error", message: error1.localizedDescription)
                }else {
                    self.telefono = "+52\(phone)"
                    let defaults = UserDefaults.standard
                    defaults.set(verificacion, forKey: "auth")
                    
                    self.performSegue(withIdentifier: self.SEGUE_CODIGO, sender: self)
                }
            }*/
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.SEGUE_CODIGO {
            let chosenPerson = segue.destination as! CodigoLoginTVC
            chosenPerson.phone = self.telefono
        }
    }
    
}

extension LoginTableViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
