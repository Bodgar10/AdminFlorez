//
//  MetodoPagoVC.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 20/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import UIKit
//import Firebase

class MetodoPagoVC: UIViewController {

    
    @IBOutlet weak var metodoPagoView: UIView!
    
    let SEGUE_TARJETA = "tarjeta"
    let SEGUE_INICIO = "inicio"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewMetodoPago))
        self.metodoPagoView.addGestureRecognizer(tap)
        self.metodoPagoView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @objc func viewMetodoPago(){
        self.performSegue(withIdentifier: self.SEGUE_TARJETA, sender: nil)
    }
    
    @IBAction func omitirBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.SEGUE_INICIO, sender: self)
    }
    

}
