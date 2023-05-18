//
//  UIView+Extension.swift
//  CemalCanNumanoglu_HW2
//
//  Created by Cemal can Numanoğlu on 19.05.2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
