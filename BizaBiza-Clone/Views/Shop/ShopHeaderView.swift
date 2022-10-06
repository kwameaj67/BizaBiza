//
//  ShopHeaderView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import UIKit

class ShopHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Shop"
        lb.font = UIFont(name: Font.bold.rawValue, size: 26)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let titleIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "shop-blue")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let searchButton: UIButton = {
        var btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.backgroundColor = .none
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let plusButton: UIButton = {
        var btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "add")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.backgroundColor = .none
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    func setupViews(){
        addSubview(titleLabel)
        addSubview(titleIcon)
        addSubview(searchButton)
        addSubview(plusButton)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            titleIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),
            titleIcon.widthAnchor.constraint(equalToConstant: 28),
            titleIcon.heightAnchor.constraint(equalToConstant: 24),
            
            searchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -15),
            searchButton.widthAnchor.constraint(equalToConstant: 26),
            searchButton.heightAnchor.constraint(equalToConstant: 26),
            
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            plusButton.widthAnchor.constraint(equalToConstant: 35),
            plusButton.heightAnchor.constraint(equalToConstant: 35),
            
          
            
        ])
    }

}
