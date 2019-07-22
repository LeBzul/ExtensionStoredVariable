//
//  UIView+Extension.swift
//  ExtensionStoredVariable_Example
//
//  Created by Drouin on 22/07/2019.
//

import UIKit

extension UIView {
    func getInfo() -> String {
        return Extension_Variable.getObject("info_key") as? String ?? ""
    }
    
    func setInfo(_ info: String) {
        Extension_Variable.setObject("info_key", value: info)
    }
    
    func getModel() -> Model? {
        return Extension_Variable.getObject("model_key") as? Model
    }
    
    func setModel(_ model: Model) {
        Extension_Variable.setObject("model_key", value: model)
    }
}
