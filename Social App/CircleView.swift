//
//  CircleView.swift
//  Social App
//
//  Created by Frank Garcia on 12/31/16.
//  Copyright © 2016 Malibit. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
