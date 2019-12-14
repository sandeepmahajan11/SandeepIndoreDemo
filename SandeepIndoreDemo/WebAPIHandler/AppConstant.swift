//
//  AppConstant.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation


/**
 *  APIConstant Class
 *
 *  Declare All The Constant Here
 *
 *  @Developed By: Sandeep Mahajan
 */
class AppConstant {
    internal static let PullToReferesh = "Pull to refresh"
}


/**
 *  NavigationConstant Struct
 *
 *  Declare All The NavigationConstant Here
 *
 *  @Developed By: Sandeep Mahajan
 */
struct NavigationConstant {
    static let titleHome = "Home"
    
}


/**
 *  BASEURL Struct
 *
 *  Change Your Server From Here
 *
 *  @Developed By: Sandeep Mahajan
 */
struct BASEURLs {
    //https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json
    
    static let development = "https://dl.dropboxusercontent.com/s/"
    static let production = "https://dl.dropboxusercontent.com/s/"
    
    static let baseURL = development
}



/**
 *  APIKeys Struct
 *
 *  All The API End Point will be declared here
 *
 *  @Developed By: Sandeep Mahajan
 */
struct APIKeys {
    
    internal static let API_JSON_DATA  = "2iodh4vg0eortkl/facts.json"
}

/**
 *  API Response Struct
 *
 *  All The API End Point will be declared here
 *
 *  @Developed By: Sandeep Mahajan
 */
struct ErrorConstant {
    internal static let APIResponseErro = "Something went wrong."
}

