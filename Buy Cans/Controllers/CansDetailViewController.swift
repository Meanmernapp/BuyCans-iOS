//
//  CansDetailViewController.swift
//  Apple Photos
//
//  Created by Shoaib's Macbook Pro on 25/01/2022.
//

import UIKit

class CansDetailViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textViewDetailed: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = Global.shared.globalImage
        self.colorView.backgroundColor = Global.shared.backGroundColor
        self.priceLabel.text = Global.shared.globalCansData?[Global.shared.index].tagLine
        self.nameLabel.text = Global.shared.globalCansData?[Global.shared.index].name
        self.textViewDetailed.text = Global.shared.globalCansData?[Global.shared.index].description
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    

    

}
