//
//  AppManager.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
import Reachability

class AppManager: NSObject {
    
    /**
     *  AppManager is Shared Class.
     *
     *  Used To Provide Or Access Common Feature
     *
     *  @Developed By: Sandeep Mahajan
     */
    static let shared = AppManager()
    
    internal static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
}


/**
 *  Internal Methods Declared
 *
 *  @Developed By: Sandeep Mahajan
 */
extension AppManager {
    
     func isNetworkAvailable()-> Bool{
        if Reachability()!.connection == Reachability.Connection.none {
            return false
        }
        return true
    }
    
     func showAlertNativeDialog(title:String, message:String,completion:@escaping ((String)->Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){ (action) in
            completion("OK")
        }
        
        alert.addAction(okAction)
        AppManager.appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

