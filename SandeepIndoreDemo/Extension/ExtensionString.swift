//
//  ExtensionURL.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation
/**
 *  Extension Of String Class
 *
 *  @Developed By: Sandeep Mahajan
 */
extension String {
    
    /**
     *  Conver string to URL
     *
     *  param key : nothing.
     *
     *  return : URL.
     *
     *  @Developed By: Sandeep Mahajan
     */
    func toUrl()->URL? {
        let url = URL(string: self.replacingOccurrences(of: " ", with: "%20"))
        return url
    }
    
    /**
     *  Removed space or trim space
     *
     *  param key : nothing.
     *
     *  return : String.
     *
     *  @Developed By: Sandeep Mahajan
     */
    func trimmedString() -> String? {
        return (self.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines)))
    }
    
}
