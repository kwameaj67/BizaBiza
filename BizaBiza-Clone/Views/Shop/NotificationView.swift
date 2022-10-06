//
//  NotificationView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import UIKit

class NotificationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.blue_bg
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Your order notifications will show here"
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let icon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "notification-white")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let todayBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("Today", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 14)
        btn.backgroundColor = .none
        btn.semanticContentAttribute = .forceRightToLeft
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let border: UIView = {
        let view = UIView()
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupViews(){
        addSubview(titleLabel)
        addSubview(icon)
        addSubview(todayBtn)
        addSubview(border)
        
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            icon.widthAnchor.constraint(equalToConstant: 18),
            icon.heightAnchor.constraint(equalToConstant: 18),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            
            todayBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            todayBtn.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            todayBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            todayBtn.heightAnchor.constraint(equalToConstant: 35),
            
            border.topAnchor.constraint(equalTo: bottomAnchor),
            border.leadingAnchor.constraint(equalTo: leadingAnchor),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
}
