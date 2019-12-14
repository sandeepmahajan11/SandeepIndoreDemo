//
//  ExtensionImageView.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
/**
 *  Extension Of ImageView Class
 *
 *  @Developed By: Sandeep Mahajan
 */
extension UIImageView{
    
    
    /**
     *  Rounded To ImageView
     *
     *  @Developed By: Sandeep Mahajan
     */
    func rounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
    }
}
