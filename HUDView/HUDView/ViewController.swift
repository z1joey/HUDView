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
        let hud = HUDView(buttonAction: {
            HUDView.dismiss()
            print("hahaha")
        })

        let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.alpha = 0.5

        hud.backgroundView = blackView
        hud.show()
    }

    @IBAction func dismissAction(_ sender: Any) {
        HUDView.dismiss()
    }
}

