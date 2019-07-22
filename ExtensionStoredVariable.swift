//
//  Extension+Variable.swift
//  Navigation
//
//  Created by Drouin on 05/04/2019.
//  Copyright © 2019 VersusMind. All rights reserved.
//

import Foundation

class AssociatedKey {
    var nameKey: String
    var defaultValue: Any?
    
    init(nameKey: String, defaultValue: Any?) {
        self.nameKey = nameKey
        self.defaultValue = defaultValue
    }
    
    var object: Any? {
        get {
            return (objc_getAssociatedObject(self, &nameKey))
        }
        set {
            objc_setAssociatedObject(self,
                                     &nameKey,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class Extension_Variable {
    static var associatedKey = [AssociatedKey]()
    
    static func getObject(_ nameKey: String) -> Any? {
        for key in associatedKey where key.nameKey == nameKey {
            return key.object != nil ? key.object : key.defaultValue
        }
        return nil
    }
    
    static func setObject(_ nameKey: String, value: Any) {
        var findedObject = false
        for key in associatedKey where key.nameKey == nameKey {
           findedObject = true
           key.object = value
        }
        
        if !findedObject {
            Extension_Variable.associatedKey.append(AssociatedKey(nameKey: nameKey, defaultValue: value))
            setObject(nameKey, value: value)
        }
    }
}
