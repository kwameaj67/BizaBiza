//
//  WalletButtonsCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class WalletButtonsCell: UITableViewCell {
  
    var controller:HomeVC? {
        didSet{
            receiveButton.addGestureRecognizer(UITapGestureRecognizer(target: controller, action: #selector(HomeVC.receiveButtonPressed)))
            sendButton.addGestureRecognizer(UITapGestureRecognizer(target: controller, action: #selector(HomeVC.sendButtonPressed)))
        }
    }
   
    let balanceData = Wallet.walletData
    static let reusableId = "WalletButtonsCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WalletButtonsCell.reusableId)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let button: UIButton = {
        var btn = UIButton()
        btn.setTitle("tap me", for: .normal)
        btn.setTitleColor(.systemGray3, for: .normal)
        btn.backgroundColor = .none
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.backgroundColor = .clear
        sv.clipsToBounds = true
        sv.isUserInteractionEnabled = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    lazy var sendButton : WalletButton = {
        let sv = WalletButton()
        sv.iconImage.image = UIImage(named: "send-blue")?.withRenderingMode(.alwaysOriginal)
        sv.nameLabel.text = "Send"
        sv.isUserInteractionEnabled = true
        return sv
    }()
    lazy var receiveButton : WalletButton = {
        let sv = WalletButton()
        sv.iconImage.image = UIImage(named: "send-green")?.withRenderingMode(.alwaysOriginal)
        sv.nameLabel.text = "Receive"
        sv.isUserInteractionEnabled = true
        return sv
    }()
    lazy var escrowButton: WalletButton = {
        let sv = WalletButton()
        sv.iconImage.image = UIImage(named: "escrow-selected")?.withRenderingMode(.alwaysOriginal)
        sv.nameLabel.text = "Escrow"
        sv.isUserInteractionEnabled = true
        return sv
    }()
    lazy var checkoutButton : WalletButton = {
        let sv = WalletButton()
        sv.iconImage.image = UIImage(named: "checkout")?.withRenderingMode(.alwaysOriginal)
        sv.nameLabel.text = "Checkout"
        sv.isUserInteractionEnabled = true
        return sv
    }()
   
    func setupViews(){
        contentView.addSubview(mainStackView)
        [sendButton,receiveButton,escrowButton ,checkoutButton].forEach { item in
            mainStackView.addArrangedSubview(item)
        }
        receiveButton.bringSubviewToFront(mainStackView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -40),
            mainStackView.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
}
