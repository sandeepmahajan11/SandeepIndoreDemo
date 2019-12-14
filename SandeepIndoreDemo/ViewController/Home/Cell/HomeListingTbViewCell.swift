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
    @IBOutlet weak var imgPicture: UIImageView! {
        didSet {
            imgPicture.rounded()
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    
    
    /**
     *  HomeListingTbViewCell Data Populating
     *
     *  @Developed By: Sandeep Mahajan
     */
    var rowsData : ResponseHomeListing.Rows? {
        didSet {
            if let title = rowsData?.title, title.trimmedString() != "" {
                self.lblTitle.text = title
            }
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
