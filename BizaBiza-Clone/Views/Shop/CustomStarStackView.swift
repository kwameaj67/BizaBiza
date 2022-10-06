//
//  CustomStarStackView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import UIKit

class CustomStarStackView: UIStackView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let icon: CustomStar = {
        let s = CustomStar(frame: .zero)
        return s
    }()
}
