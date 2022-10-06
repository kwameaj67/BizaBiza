//
//  ReceiveMoneyOption.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/09/2022.
//

import UIKit

class ReceiveMoneyOption: UIStackView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        
        axis = .horizontal
        spacing = 20
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = Color.border_bg.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 20
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let title: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let subTitle: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.textColor = Color.grey
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let icon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    func setupViews(){
        addSubview(iconContainer)
        addSubview(title)
        addSubview(subTitle)
        addSubview(icon)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            iconContainer.heightAnchor.constraint(equalToConstant: 50),
            iconContainer.widthAnchor.constraint(equalToConstant: 50),
            iconContainer.topAnchor.constraint(equalTo:topAnchor,constant: 20),
            iconContainer.leadingAnchor.constraint(equalTo:leadingAnchor,constant: 20),
            
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.widthAnchor.constraint(equalToConstant: 24),
            
            title.topAnchor.constraint(equalTo:topAnchor,constant: 20),
            title.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor,constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            
            subTitle.topAnchor.constraint(equalTo:title.bottomAnchor,constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor,constant: 20),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
        ])
    }
}
