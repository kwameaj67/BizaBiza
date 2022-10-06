//
//  ReceiveMoneyOptionsCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/09/2022.
//

import UIKit

class ReceiveMoneyOptionsCell: UITableViewCell {

    static let reusableId = "ReceiveMoneyOptionsCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ReceiveMoneyOptionsCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    lazy var shopOrderBtn: ReceiveMoneyOption = {
        let view = ReceiveMoneyOption()
        view.iconContainer.backgroundColor = Color.violet_bg2
        view.icon.image = UIImage(named: "shop-black")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        view.title.text = "Receive Shop order"
        view.subTitle.text = "Friends can send you orders from your favorite Shop seller"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var agreementBtn: ReceiveMoneyOption = {
        let view = ReceiveMoneyOption()
        view.iconContainer.backgroundColor = Color.purple
        view.icon.image = UIImage(named: "card-white")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        view.title.text = "Receive Agreements"
        view.subTitle.text = "Buyers or sellers can send you an agreements based on agreed terms to initiate an escrow"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    func setupViews(){
        contentView.addSubview(shopOrderBtn)
        contentView.addSubview(agreementBtn)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            shopOrderBtn.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            shopOrderBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            shopOrderBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            shopOrderBtn.heightAnchor.constraint(equalToConstant: 120),
            
            agreementBtn.topAnchor.constraint(equalTo: shopOrderBtn.bottomAnchor,constant: 30),
            agreementBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            agreementBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            agreementBtn.heightAnchor.constraint(equalToConstant: 120),
            
        ])
    }
}
