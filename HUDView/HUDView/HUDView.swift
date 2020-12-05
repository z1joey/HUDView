
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

    var backgroundView: UIView?

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

        if backgroundView != nil {
            backgroundView!.frame = window.bounds
            backgroundView!.alpha = 0
            window.addSubview(backgroundView!)
        }

        frame.origin.y = -frame.height
        window.addSubview(self)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, animations: {
            self.backgroundView?.alpha = 0.5
            self.center = window.center
        }, completion: { _ in
            print("job done")
        })
    }

    static func dismiss() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        guard let hudView = window.subviews.first(where: { $0 is HUDView }) else { return }

        UIView.animate(withDuration: 0.2, animations: {
            hudView.frame.origin.y = -hudView.frame.height
            (hudView as? HUDView)?.backgroundView?.alpha = 0
        }, completion: { _ in
            hudView.removeFromSuperview()
            (hudView as? HUDView)?.backgroundView?.removeFromSuperview()
        })
    }
}
