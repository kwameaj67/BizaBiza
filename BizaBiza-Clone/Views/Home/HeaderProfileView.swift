//
//  HeaderProfileView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class HeaderProfileView: UITableViewHeaderFooterView {
    static let reusableId = "HeaderProfileView"
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: HeaderProfileView.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties -
    let profileImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "profileImage")?.withRenderingMode(.alwaysOriginal)
        iv.tintColor = .systemGray2
        iv.layer.borderWidth = 1.5
        iv.layer.borderColor = UIColor.black.cgColor
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 48/2
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let profileName: UILabel = {
        let lb = UILabel()
        lb.text = "Hi, Kwame Boateng"
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let notificationImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image =  UIImage(named: "notification")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    func setupViews(){
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(notificationImage)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.heightAnchor.constraint(equalToConstant: 48),
            
            profileName.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 10),
            
            notificationImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            notificationImage.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            notificationImage.widthAnchor.constraint(equalToConstant: 24),
            notificationImage.heightAnchor.constraint(equalToConstant: 24),
            
            
        ])
    }
}
