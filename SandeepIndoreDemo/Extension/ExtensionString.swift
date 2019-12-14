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
     *  Used to conver string to URL
     *
     *  Called only by string object
     *
     *  @Developed By: Sandeep Mahajan
     */
    func toUrl()->URL? {
        let url = URL(string: self.replacingOccurrences(of: " ", with: "%20"))
        return url
    }
    
    
    func trimmedString() -> String? {
        return (self.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines)))
    }
    
}
