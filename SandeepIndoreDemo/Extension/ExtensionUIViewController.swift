//
//  ExtensionUIViewController.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
import Toast_Swift

/**
 *  Class function.
 *
 *  @param key : Not required.
 *
 *  @return String.
 *
 *  @Developed By: Sandeep Mahajan
 */
public extension NSObject{
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}

//MARK:- Make Android Toast
extension UIViewController {
    func makeAndroidToast(title: String?){
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .darkGray
        ToastManager.shared.style = style
        self.view.makeToast(title, duration: 2.0, position: .bottom, style: style)
    }
}
