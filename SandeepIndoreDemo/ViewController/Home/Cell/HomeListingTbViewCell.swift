//
//  HomeListingTbViewCell.swift
//  SandeepIndoreDemo
//
//  Created by consagous on 14/12/19.
//

import UIKit


class HomeListingTbViewCell: UITableViewCell {
    /**
     *  HomeListingTbViewCell Properties Declared
     *
     *  @Developed By: Sandeep Mahajan
     */
    
    // imgPicture : Image holder on cell
    let imgPicture:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.rounded()
        
        return img
    }()
    
    // lblTitle : Title holder on cell
    let lblTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // lblDesc : Description holder on cell
    let lblDesc:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor =  .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    /**
     *  HomeListingTbViewCell Data Populating
     *
     *  @Developed By: Sandeep Mahajan
     */
    var rowsData : ResponseHomeListing.Rows? {
        didSet {
            self.lblTitle.text = ""
            if let title = rowsData?.title, title.trimmedString() != "" {
                self.lblTitle.text = title
            }
            self.lblDesc.text = ""
            if let desc = rowsData?.description, desc.trimmedString() != "" {
                self.lblDesc.text = desc
            }
            if let url = rowsData?.imageHref?.toUrl() {
                self.imgPicture.sd_setImage(with: url ,placeholderImage: #imageLiteral(resourceName: "bg"),completed: nil)
            }else {
                self.imgPicture.image = #imageLiteral(resourceName: "bg")
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    /**
     *  init method to initialize controls
     *
     *  @Developed By: Sandeep Mahajan
     */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imgPicture)
        self.contentView.addSubview(lblTitle)
        self.contentView.addSubview(lblDesc)
        
        imgPicture.mas_remakeConstraints { (make) in
            make?.left.setOffset(10)
            make?.top.setOffset(10)
            make?.bottom.lessThanOrEqualTo()(-10)
            make?.width.setOffset(100)
            make?.height.setOffset(100)
        }
        
        
        lblTitle.mas_remakeConstraints { (make) in
            make?.left.equalTo()(imgPicture.mas_right)?.with().offset()(10)
            make?.right.setOffset(-10)
            make?.top.setOffset(10)
            make?.height.equalTo()(20)
        }
        
        lblDesc.mas_remakeConstraints { (make) in
            make?.left.equalTo()(imgPicture.mas_right)?.with().offset()(10)
            make?.right.setOffset(-10)
            make?.top.equalTo()(lblTitle.mas_bottom)?.with().offset()(10)
            make?.bottom.setOffset(-10)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}



 
