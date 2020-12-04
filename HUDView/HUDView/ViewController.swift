//
//  ViewController.swift
//  HUDView
//
//  Created by Yi Zhang on 2020/12/2.
//  Copyright © 2020 Yi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hudView: HUDView?
    var shouldShowHUD: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //animateOnWindow()
        hudView = HUDView.init(frame: CGRect(x: 100, y: -100, width: 100, height: 100))

        HUD.show(hudView)
    }

    func animateOnWindow() {
        guard hudView == nil else { return }

        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        hudView = HUDView.init(frame: CGRect(x: 100, y: -100, width: 100, height: 100))
        window?.addSubview(hudView!)

        UIView.animate(withDuration: 1) {
            self.hudView?.frame.origin.y = 100
        }
    }
}

