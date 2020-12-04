//
//  HUD.swift
//  HUDView
//
//  Created by joey on 12/4/20.
//  Copyright © 2020 Yi Zhang. All rights reserved.
//

import UIKit

open class HUD: UIView {
    private static var _hud: UIView?

    public static func show(_ hud: UIView?, y: CGFloat = 100, duration: Double = 5, completion: (() -> Void)? = nil) {
        guard hud != nil, HUD._hud == nil else { return }
        HUD._hud = hud
        HUD._hud!.alpha = 1
        HUD._hud!.frame.origin.y = -hud!.frame.height

        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        window?.addSubview(HUD._hud!)

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            HUD._hud!.frame.origin.y = y
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                UIView.animate(withDuration: 1, delay: 0, animations: {
                    HUD._hud!.frame.origin.y = -HUD._hud!.frame.height
                    HUD._hud?.alpha = 0
                }, completion: { _ in
                    HUD._hud?.removeFromSuperview()
                    HUD._hud = nil
                    completion?()
                })
            }
        })
    }
}
