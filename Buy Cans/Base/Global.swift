//
//  Global.swift
//  Vocab
//
//  Created by Shoaib's Macbook Pro on 26/12/2021.
//

import Foundation
import UIKit

class Global {
    
    class var shared : Global {
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    
    var backGroundColor = UIColor.random()
    var index = 0
    var globalCansData : [CansModel]?
    var globalUserData : [UserModel]?
    var globalImage : UIImage?
    
}
