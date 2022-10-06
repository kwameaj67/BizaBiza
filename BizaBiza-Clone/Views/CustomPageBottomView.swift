//
//  CustomPageBottomView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/09/2022.
//

import UIKit

class CustomPageBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        backgroundColor = .white
        
        // shadows
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowRadius = 3
        layer.masksToBounds  = false
        layer.shadowOffset =  CGSize(width: 0, height: -3)
        layer.shadowOpacity = 0.2
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let arrowButton: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: "arrow-green")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        btn.backgroundColor = Color.blue
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let continueButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Continue", for: .normal)
        btn.setTitleColor(Color.grey, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.backgroundColor = Color.light_grey
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    func setupViews(){
        addSubview(arrowButton)
        addSubview(continueButton)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            
            arrowButton.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            arrowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            arrowButton.heightAnchor.constraint(equalToConstant: 56),
            arrowButton.widthAnchor.constraint(equalToConstant: 75),
            
            continueButton.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            continueButton.leadingAnchor.constraint(equalTo: arrowButton.trailingAnchor, constant: 10),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            continueButton.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }

}
