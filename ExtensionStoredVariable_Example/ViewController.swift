//
//  ViewController.swift
//  ExtensionStoredVairiable_Example
//
//  Created by Drouin on 22/07/2019.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setInfo("UIView Information")
        print(self.view.getInfo())
        
        self.view.setModel(Model(name: "Name", type: 90))
        print("Model name : \(self.view.getModel()?.name ?? "NoValue Name")")
        print("Model type : \(self.view.getModel()?.type ?? -1)")
    }

}
