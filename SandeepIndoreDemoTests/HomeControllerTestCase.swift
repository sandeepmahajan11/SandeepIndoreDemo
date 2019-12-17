//
//  HomeControllerTestCase.swift
//  SandeepIndoreDemoTests
//
//  Created by consagous on 15/12/19.
//

import XCTest
@testable import SandeepIndoreDemo

class HomeControllerTestCase: XCTestCase {

    var homeController : HomeController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.homeController = (storyboard.instantiateViewController(withIdentifier: "HomeController") as? HomeController)
        self.homeController.homeViewModel.numberOfRows = 5
        self.homeController.loadView()
        self.homeController.viewDidLoad()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHASATableView() {
        XCTAssertNotNil(self.homeController.tbViewHomeListing)
    }

    func testTableViewHasDelegate() {
        XCTAssertNotNil(self.homeController.tbViewHomeListing.delegate)
    }
    
    func testTableViewHasDatasource() {
        XCTAssertNotNil(self.homeController.tbViewHomeListing.dataSource)
    }
    
    func testTableViewListing() {
        XCTAssertNotNil(self.homeController.tbViewHomeListing.reloadData())
    }
    
    func testTableViewConformsToTheDatasourceProtocol() {
        XCTAssertTrue(self.homeController.conforms(to: UITableViewDataSource.self))
        
        XCTAssertTrue(self.homeController.responds(to: #selector(self.homeController.numberOfSections(in:))))
        
        
        XCTAssertTrue(self.homeController.responds(to: #selector(self.homeController.tableView(_:numberOfRowsInSection:))))
        
        XCTAssertTrue(self.homeController.responds(to: #selector(self.homeController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = self.homeController.tableView(self.homeController.tbViewHomeListing, cellForRowAt: IndexPath(row: 0, section: 0))  as? HomeListingTbViewCell
        
        let existReuseId = cell?.reuseIdentifier
        let expectedIdentifier = "HomeListingTbViewCell"
        
        XCTAssertEqual(existReuseId, expectedIdentifier)
        
    }

    func testAPICalling(){
        
        let expectation = self.expectation(description: "simple expectation")
        
        let url = (BASEURLs.baseURL + APIKeys.API_JSON_DATA).toUrl()
        
        var result : NSDictionary?
        
        APIManager.request(url: url, showLoader: false) { (status, response, message) in
            result = response
            expectation.fulfill()
            XCTAssert(status == true, "status is not matching the server data")
        }

        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(result)
        }
    }
}
