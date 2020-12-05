//
//  ViewController.swift
//  HUDView
//
//  Created by Yi Zhang on 2020/12/2.
//  Copyright © 2020 Yi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shouldShowHUD: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAction(_ sender: Any) {
        HUDView(buttonAction: {
            print("hahaha")
        }).show()
    }

    @IBAction func dismissAction(_ sender: Any) {
        HUDView.dismiss()
    }
}

