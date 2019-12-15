//
//  AppManager.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
import Reachability

/**
 *  AppManager is Shared Class.
 *
 *  Used To Provide Or Access Common Feature
 *
 *  @Developed By: Sandeep Mahajan
 */
class AppManager: NSObject {
    
    static let shared = AppManager()
    
    internal static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
}


extension AppManager {
    
    /**
     *  To Check Internet Connection
     *
     *  Param : No parameter required
     *
     *  return : Boolean value return
     *
     *  @Developed By: Sandeep Mahajan
     */
     func isNetworkAvailable()-> Bool{
        if Reachability()!.connection == Reachability.Connection.none {
            return false
        }
        return true
    }
    
    
    /**
     *  To Show Alert Message
     *
     *  Param : Takes two argument title & message
     *
     *  return : Button action return
     *
     *  @Developed By: Sandeep Mahajan
     */
     func showAlertNativeDialog(title:String, message:String,completion:@escaping ((String)->Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){ (action) in
            completion("OK")
        }
        
        alert.addAction(okAction)
        AppManager.appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

