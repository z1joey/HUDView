
//
//  HUDControl.swift
//  TableViewBackground
//
//  Created by Yi Zhang on 2020/12/2.
//  Copyright © 2020 Yi Zhang. All rights reserved.
//

import UIKit

class HUDView: UIView, NibLoadable {
    @IBOutlet weak var button: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(owner: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonTapped(_ sender: UIButton) {
        print("tapped")
    }

    @IBAction func buttonAction(_ sender: Any) {
        print("tap")
    }
}
