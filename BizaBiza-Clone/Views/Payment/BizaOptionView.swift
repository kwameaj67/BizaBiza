//
//  BizaOptionView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class BizaOptionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let title: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
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
        addSubview(icon)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            iconContainer.heightAnchor.constraint(equalToConstant: 52),
            iconContainer.widthAnchor.constraint(equalToConstant: 52),
            iconContainer.topAnchor.constraint(equalTo:topAnchor),
            iconContainer.leadingAnchor.constraint(equalTo:leadingAnchor),
            
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            icon.heightAnchor.constraint(equalToConstant: 22),
            icon.widthAnchor.constraint(equalToConstant: 22),
            
            title.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor,constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
