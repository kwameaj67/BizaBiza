//
//  WalletButton.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class WalletButton: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImage.widthAnchor.constraint(equalToConstant: 35),
            iconImage.heightAnchor.constraint(equalToConstant: 35),
            
            
        ])
        isUserInteractionEnabled = true
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties
    let stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.spacing = 20
        v.distribution = .fill
        v.alignment = .center
        v.isUserInteractionEnabled = true
        return v
    }()
    let iconImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.isUserInteractionEnabled = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        addSubview(stackView)
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(nameLabel)
    }
}
