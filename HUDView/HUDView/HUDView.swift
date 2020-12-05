
//
//  HUDControl.swift
//  TableViewBackground
//
//  Created by Yi Zhang on 2020/12/2.
//  Copyright © 2020 Yi Zhang. All rights reserved.
//

import UIKit

typealias ButtonActionBlock = (() -> Void)

class HUDView: UIView, NibLoadable {
    @IBOutlet weak var button: UIButton!

    private var buttonActionBlock: ButtonActionBlock?

    init(buttonAction: ButtonActionBlock?) {
        super.init(frame: CGRect(x: 20, y: 100, width: 300, height: 200))
        loadFromNib(owner: self)
        self.buttonActionBlock = buttonAction
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Deint HUD")
    }

    @objc func buttonTapped(_ sender: UIButton) {
        print("tapped")
    }

    @IBAction func buttonAction(_ sender: Any) {
        buttonActionBlock?()
    }

    func show() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        guard window.subviews.contains(where: { $0 is HUDView}) == false else { return }

        frame.origin.y = -frame.height
        window.addSubview(self)
        
        UIView.animate(withDuration: 1) {
            self.center = window.center
        }
    }

    static func dismiss() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        guard let hudView = window.subviews.first(where: { $0 is HUDView }) else { return }

        UIView.animate(withDuration: 1, animations: {
            hudView.frame.origin.y = -hudView.frame.height
        }, completion: { _ in
            hudView.removeFromSuperview()
        })
    }
}
