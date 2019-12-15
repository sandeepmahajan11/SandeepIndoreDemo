//
//  ExtensionUIViewController.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
import Toast_Swift

public extension NSObject{
    /**
     *  Class function, called by class name only
     *
     *  param key : Not required.
     *
     *  return : String.
     *
     *  @Developed By: Sandeep Mahajan
     */
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}


extension UIViewController {
    /**
     *  Toast Message,Like Android Toast
     *
     *  param key : Takes one param title.
     *
     *  return : nothing.
     *
     *  @Developed By: Sandeep Mahajan
     */
    func makeAndroidToast(title: String?){
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .darkGray
        ToastManager.shared.style = style
        self.view.makeToast(title, duration: 2.0, position: .bottom, style: style)
    }
}
