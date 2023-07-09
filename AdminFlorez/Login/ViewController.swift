//
//  ViewController.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 19/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
//import FirebaseAuth
//import Firebase
//import NVActivityIndicatorView

class ViewController: UIViewController {

    let SEGUE_LOGIN = "login"
    let SEGUE_REGISTRO = "registro"
    let SEGUE_INICIO = "inicio"
    let SEGUE_ADMIN = "admin"
    let SEGUE_REPAR = "repartidor"
    
    //var activityIndicator: NVActivityIndicatorView!
    
    @IBOutlet weak var vistaRosa: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Esto es de mi nueva rama de Bodgar")
        
        let layer = CAGradientLayer()
        
        layer.frame = self.vistaRosa.bounds
        
        let color = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 1.0).cgColor
        let color1 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.6).cgColor
        let color2 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.5).cgColor
        let color3 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.4).cgColor
        let color4 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.3).cgColor
        let color5 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.2).cgColor
        let color6 = UIColor(red:0.8078431373 , green: 0.4392156863, blue: 0.6196078431, alpha: 0.0).cgColor
        layer.colors = [color6,color6,color6,color5,color4,color3,color2,color1,color,color]
        layer.startPoint = CGPoint(x: 1, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        self.vistaRosa.layer.addSublayer(layer)
        //BajarInfo.Instance.logOut()
        /*if let uid = Auth.auth().currentUser?.uid {
            self.startActivityIndicator()
            BajarInfo.Instance.bajarUsuarios { (usuario) in
                //print("ENTRAMOS: \(usuario.id_user) con: \(uid)")
                if usuario.id_user == uid {
                    
                    if usuario.codigo == "nil" {
                        BajarInfo.Instance.randomString(length: 6)
                    }
                    //self.notificationSend(message: "PRUEBA DE NOTIFICACIÓN", token: usuario.token)
                    //print("ENTRAMOS: \(usuario.tipo)")
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
                        let storyboard = UIStoryboard(name: "Repartidor", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: self.SEGUE_REPAR)
                        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.flipHorizontal
                        vc.modalTransitionStyle = modalStyle
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }*/
    }
    
    @IBAction func entrarBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.SEGUE_LOGIN, sender: nil)
    }
    
    @IBAction func registrarseBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.SEGUE_REGISTRO, sender: nil)
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

