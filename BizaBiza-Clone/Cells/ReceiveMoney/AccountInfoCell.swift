//
//  AccountInfoCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/09/2022.
//

import UIKit

class AccountInfoCell: UITableViewCell {

    static let reusableId = "AccountInfoCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: AccountInfoCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let infoContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.alignment = .center
        sv.backgroundColor = .clear
        sv.layer.borderWidth = 1
        sv.layer.borderColor = Color.border_bg.cgColor
        sv.layer.cornerRadius = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let buttonContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.alignment = .center
        sv.backgroundColor = .clear
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let accountNumberLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let bankNameLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let copyButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Copy", for: .normal)
        btn.setTitleColor(Color.blue, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.setImage(UIImage(named: "copy")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.semanticContentAttribute = .forceLeftToRight
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        btn.backgroundColor = .none
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.border_bg.cgColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let shareButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.backgroundColor = .none
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.border_bg.cgColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        contentView.addSubview(infoContainer)
        [nameLabel,accountNumberLabel,bankNameLabel].forEach{
            infoContainer.addArrangedSubview($0)
        }
        contentView.addSubview(buttonContainer)
        [copyButton,shareButton].forEach{
            buttonContainer.addArrangedSubview($0)
        }
        nameLabel.attributedText = setupAttributedText("Name", "Kwame Boateng")
        accountNumberLabel.attributedText = setupAttributedText("Account number", "1002747349")
        bankNameLabel.attributedText = setupAttributedText("Bank name", "BIZA WALLET")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            infoContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            infoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            infoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            infoContainer.heightAnchor.constraint(equalToConstant: 290),
            
            buttonContainer.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 20),
            buttonContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            buttonContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            buttonContainer.heightAnchor.constraint(equalToConstant: 60),
            
            copyButton.heightAnchor.constraint(equalToConstant: 54),
            shareButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    func setupAttributedText(_ title: String, _ subTitle: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):\n\n", attributes: [NSAttributedString.Key.foregroundColor: Color.grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: "\(subTitle)", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 18)!]))
        return text
    }
}
