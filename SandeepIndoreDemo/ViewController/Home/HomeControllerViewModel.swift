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
 
    // TableView numberOfSection
    var numberOfSection = 1
    
    // TableView numberOfRows
    var numberOfRows = 0
    
    // api success
    var successFetchListing : (()->())?
    
    // api failure
    var failureFetchListing : (()->())?
    
    // api response holder
    var resHomeListing : ResponseHomeListing?
}


extension HomeControllerViewModel {
    /**
     *  HomeController ViewModel API
     *
     *  @Developed By: Sandeep Mahajan
     */
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
