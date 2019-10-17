//
//  RoundedView.swift
//  Jumia
//
//  Created by Mustafa on 10/16/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

  
    
    func setupView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }

}
