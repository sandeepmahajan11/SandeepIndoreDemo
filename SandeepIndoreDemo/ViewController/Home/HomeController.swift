//
//  ViewController.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import UIKit

class HomeController: BaseController {
/*let contactsTableView = UITableView() // view*/
    
    /**
     *  HomeController Properties Declared
     *
     *  @Developed By: Sandeep Mahajan
     */
    var homeViewModel = HomeControllerViewModel()
    
     var tbViewHomeListing = UITableView()
    
    
    
    //MARK:- Making Refersh control
    lazy var refreshControl: UIRefreshControl = {
        let rfControl = UIRefreshControl()
         rfControl.attributedTitle = NSAttributedString(string: AppConstant.PullToReferesh)
        rfControl.addTarget(self, action: #selector(self.refresh(sender:)), for: UIControl.Event.valueChanged)
        tbViewHomeListing.addSubview(rfControl)
        return rfControl
    }()

    
    
    /**
     *  UIView Life Cycle
     *
     *  @Developed By: Sandeep Mahajan
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = NavigationConstant.titleHome
        self.configTableView()
        self.configTableViewCell()
        self.getListing()        
    }

    
    
    

}

extension HomeController {
    /**
     * Configure tablview , set delegate, datasource,footerview
     *
     * Param : nothing
     *
     * Return : nothing
     *
     *  @Developed By: Sandeep Mahajan
     */
    func configTableView(){
        
        self.view.addSubview(tbViewHomeListing)
        
        self.tbViewHomeListing.translatesAutoresizingMaskIntoConstraints = false
        
        tbViewHomeListing.mas_remakeConstraints { (make) in
            make?.left.setOffset(0)
            make?.top.setOffset(0)
            make?.bottom.setOffset(0)
            make?.right.setOffset(0)
        }
        
        self.tbViewHomeListing.delegate = self
        self.tbViewHomeListing.dataSource = self
        self.tbViewHomeListing.keyboardDismissMode = .onDrag
        self.tbViewHomeListing.tableFooterView = UIView()
        self.tbViewHomeListing.allowsSelection = false
    }
    
    func configTableViewCell(){
        self.tbViewHomeListing.register(HomeListingTbViewCell.self, forCellReuseIdentifier: HomeListingTbViewCell.nameOfClass)
        
    }
}


/**
 *  Tableview Datasource.
 *
 *  @Developed By: Sandeep Mahajan
 */
extension HomeController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeViewModel.numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let homeCell = tableView.dequeueReusableCell(withIdentifier: HomeListingTbViewCell.nameOfClass) as? HomeListingTbViewCell {
            let row = self.homeViewModel.resHomeListing?.rows![indexPath.row]
            homeCell.rowsData = row
            cell = homeCell
        }
        return cell
    }
}


/**
 *  Tableview Delegate.
 *
 *  @Developed By: Sandeep Mahajan
 */
extension HomeController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


/**
 *  API Calling.
 *
 *  @Developed By: Sandeep Mahajan
 */
extension HomeController  {
    
    /**
     * Get home lsiting from API Response
     *
     * Param : nothing
     *
     * Return : nothing
     *
     * @Developed By: Sandeep Mahajan
     */
    func getListing(){
        homeViewModel.getListing()
        homeViewModel.successFetchListing = {
            OperationQueue.main.addOperation {
                if let title = self.homeViewModel.resHomeListing?.title {
                    self.title = title
                }
                self.refreshControl.endRefreshing()
                self.tbViewHomeListing.reloadData()
            }
        }
        
        homeViewModel.failureFetchListing = {
            OperationQueue.main.addOperation {
                self.refreshControl.endRefreshing()
                if self.homeViewModel.resHomeListing == nil {
                    self.makeAndroidToast(title: ErrorConstant.APIResponseErro)
                }
            }
        }
    }
    
    /**
     * Referesh control, To refersh listing by calling api
     *
     * Param : Anyobject
     *
     * Return : nothing
     *
     * @Developed By: Sandeep Mahajan
     */
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        self.getListing()
    }
    
}

