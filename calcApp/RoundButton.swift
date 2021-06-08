//
//  RoundButton.swift
//  calcApp
//
//  Created by Yuu Tanaka on 2021/06/08.
//

import UIKit

class RoundButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 70, height: 70)
        layer.cornerRadius = frame.height / 2
    }
}
