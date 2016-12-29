//
//  RoundBtn.swift
//  Social App
//
//  Created by Frank Garcia on 12/29/16.
//  Copyright © 2016 Malibit. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        
    }
    

}
