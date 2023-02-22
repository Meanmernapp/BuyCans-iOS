//
//  AppUtility.swift
//  Buy Cans
//
//  Created by Shoaib Hassan on 22/02/2023.
//

import Foundation
import SwiftMessages

class AppUtility {
    
    class func showErrorMessage(message:String) {
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: "Error", body: message)
        error.button?.isHidden = true
        SwiftMessages.show(view: error)
    }
    
    class func showSuccessMessage(message:String) {
        let success = MessageView.viewFromNib(layout: .tabView)
        success.configureTheme(.success)
        success.configureContent(title: "Success", body: message)
        success.button?.isHidden = true
        SwiftMessages.show(view: success)
    }
    
    class func showInfoMessage(message:String) {
        let info = MessageView.viewFromNib(layout: .tabView)
        info.configureTheme(.warning)
        info.configureContent(title: "Info", body: message)
        info.button?.isHidden = true
        SwiftMessages.show(view: info)
    }
    
    
    
}
