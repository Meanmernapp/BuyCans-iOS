//
//  UsersTableViewCell.swift
//  Buy Cans
//
//  Created by Shoaib Hassan on 22/02/2023.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func config(userData:UserModel? = nil) {
        guard let userData else {return}
        self.nameLbl.text = "Name: " + (userData.name ?? "None")
        self.cityLbl.text = "City: " + (userData.address?.city ?? "None")
        self.companyLbl.text = "Company: " + (userData.company?.name ?? "None")
        self.mainView.backgroundColor = .random()
        
    }
    
}
