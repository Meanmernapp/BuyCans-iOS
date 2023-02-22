//
//  CansTableViewCell.swift
//  Apple Photos
//
//  Created by HaiDer's Macbook Pro on 25/01/2022.
//

import UIKit
import SDWebImage

enum TypeOfTab {
    case user
    case cans
}

class CansTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var customBackGroundColor: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceOrCityLabel: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    
    //MARK: - Variables
    
    let image = [UIImage(named: "Image0"),UIImage(named: "Image1"),UIImage(named: "Image2"),UIImage(named: "Image3")]
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK: - Functions
    
    func config(_ cansData:CansModel? = nil) {
        guard let cansData else {return}
        self.customBackGroundColor.backgroundColor = .random()
        self.nameLabel.text = cansData.name
        self.priceOrCityLabel.text = cansData.tagLine
        if let image = cansData.image , let url = URL(string: image)  {
            self.imgView.sd_setImage(with: url, placeholderImage: self.image.randomElement()!)
        }
        
        self.detailLbl.isHidden = true
    }
    
}

