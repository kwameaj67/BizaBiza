//
//  CustomStar.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import UIKit

class CustomStar: UIImageView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
