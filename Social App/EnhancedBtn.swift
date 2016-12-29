//
//  EnhancedBtn.swift
//  Social App
//
//  Created by Frank Garcia on 12/29/16.
//  Copyright © 2016 Malibit. All rights reserved.
//

import UIKit

class EnhancedBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        layer.cornerRadius = 2.0
        
    }

}
