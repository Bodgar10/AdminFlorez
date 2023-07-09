//
//  Extensions.swift
//  AdminFlorez
//
//  Created by Bodgar Jair Espinosa Miranda on 08/07/23.
//

import Foundation
import UIKit
//import Firebase

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImage(from imgURL: String!) {
        
        self.image = nil
        
        if imageCache.object(forKey: imgURL as AnyObject) as? UIImage != nil {
            if let cachedImage = imageCache.object(forKey: imgURL as AnyObject) as? UIImage {
                
                self.image = cachedImage
                return
            }else{
                print("ERROR GRANDE")
            }
        }else{
            //print("ÑO SE PUEDE")
        }
        
        let url = URLRequest(url: URL(string: imgURL)!)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    
                    imageCache.setObject(downloadedImage, forKey: imgURL as AnyObject)
                    self.image = downloadedImage
                }
            }
        }
        
        task.resume()
    }
}
extension UIViewController {
    func hideKeyboardWhenTappingAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //ALERT CONTROLLER
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func notificationSend(message: String, token: String) {
        print("Se envia la notificación al token: \(token)")
        if let url = URL(string: "https://fcm.googleapis.com/fcm/send") {
            
            var request = URLRequest(url: url)
            
            let key = "key=AAAANlWNZ3g:APA91bHr1rajEdf7OB-ZbvhLY0NboVt_Ya8ikMfhPn9j_GmTxtm0YEXmIdiZem_1HdCpQX5zp_GT7nFvcmQpq38vEkrv6LJABH6icGicCqdH_e3Acc5DR5twccOp20e-uGb-MUjwUTp8"
            
            request.allHTTPHeaderFields = ["Authorization": key,
                                           "Content-Type": "application/json"]
            request.httpMethod = "POST"
            request.httpBody = "{\"to\": \"\(token)\", \"notification\":{\"body\":\"\(message)\", \"sound\": \"sms-received.wav\"}}".data(using: .utf8)
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print("Error")
                }
                
                print("DATA: \(data), RESPONSE: \(response), ERROR: \(error)")
            }).resume()
        }
    }
    //func alertChangeMoneda(usd:String, segueUsd:String, mxn:String, segueMxn:String)
}

extension UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

/*extension UIColor {
 func as1ptImage() -> UIImage {
 UIGraphicsBeginImageContext(CGSize(width: 2, height: 2))
 setFill()
 UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 2, height: 2))
 let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
 UIGraphicsEndImageContext()
 return image
 }
 }*/

/*extension UIView {
 
 @IBInspectable var cornerRadius: CGFloat {
 get {
 return layer.cornerRadius
 }
 set {
 layer.cornerRadius = newValue
 layer.masksToBounds = newValue > 0
 }
 }
 
 @IBInspectable var borderWidth: CGFloat {
 get {
 return layer.borderWidth
 }
 set {
 layer.borderWidth = newValue
 }
 }
 
 @IBInspectable var borderColor: UIColor? {
 get {
 return UIColor(cgColor: layer.borderColor!)
 }
 set {
 layer.borderColor = newValue?.cgColor
 }
 }
 }*/

