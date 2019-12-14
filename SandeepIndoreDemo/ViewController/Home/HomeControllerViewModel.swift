//
//  HomeControllerViewModel.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import Foundation

/**
 *  HomeController ViewModel Class.
 *
 *  @Developed By: Sandeep Mahajan
 */
class HomeControllerViewModel {
 
    var numberOfSection = 1
    var numberOfRows = 0
    
    var successFetchListing : (()->())?
    var failureFetchListing : (()->())?
    var resHomeListing : ResponseHomeListing?
}


/**
 *  HomeController ViewModel API
 *
 *  @Developed By: Sandeep Mahajan
 */
extension HomeControllerViewModel {
    func getListing(){
        
        let url = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
        
        APIManager.request(url: url, showLoader: false) { (status, response, message) in
            if status {
                if let responseDict = response {
                    let res:ResponseHomeListing? = ResponseHomeListing().getModelObjectFromServerResponse(jsonResponse: responseDict)
                    self.resHomeListing = res
                    self.numberOfRows = self.resHomeListing?.rows?.count ?? 0
                    debugPrint(responseDict)
                }
                self.successFetchListing?()
            }else {
                self.failureFetchListing?()
            }
        }
    }
}
