//
//  AgreementCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 24/09/2022.
//

import UIKit

class AgreementCell: UITableViewCell {

    static let reusableId = "AgreementCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: AgreementCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = Color.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let escrowIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "card-white")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let summaryLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.dark_grey
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let sellerContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = Color.border_bg.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let buyerContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = Color.border_bg.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let saleContainer: UIView = {
        let view = UIView()
        view.backgroundColor =  Color.yellow_bg
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let saleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Sale"
        lb.textColor = Color.yellow
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 12)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let purchaseContainer: UIView = {
        let view = UIView()
        view.backgroundColor =  Color.light_blue_bg
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let purchaseLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Purchase"
        lb.textColor = Color.light_blue
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 12)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let sellerIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "shop-black")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        iv.image?.withTintColor(.black)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let sellerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "I am the seller"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let buyerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "I am the buyer"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let buyerIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "shop-deselected")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        iv.image?.withTintColor(.black)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupViews(){
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(escrowIcon)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(sellerContainer)
        [sellerIcon,sellerLabel,saleContainer].forEach{
            sellerContainer.addSubview($0)
        }
        saleContainer.addSubview(saleLabel)
        contentView.addSubview(buyerContainer)
        [buyerIcon,buyerLabel,purchaseContainer].forEach{
            buyerContainer.addSubview($0)
        }
        purchaseContainer.addSubview(purchaseLabel)
        summaryLabel.attributedText = setupAttributedText("Escrow by biza wallet is a new way to securely buy, sell, and transact with strangers online and in person.", " Create an agreement below to get started")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            iconContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            iconContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconContainer.heightAnchor.constraint(equalToConstant: 56),
            iconContainer.widthAnchor.constraint(equalToConstant: 56),
            
            escrowIcon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            escrowIcon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            escrowIcon.heightAnchor.constraint(equalToConstant: 32),
            escrowIcon.widthAnchor.constraint(equalToConstant: 32),
            
            summaryLabel.topAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: 35),
            summaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            summaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            summaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            // seller container
            sellerContainer.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 15),
            sellerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            sellerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            sellerContainer.heightAnchor.constraint(equalToConstant: 72),
            
            sellerIcon.centerYAnchor.constraint(equalTo: sellerContainer.centerYAnchor),
            sellerIcon.leadingAnchor.constraint(equalTo: sellerContainer.leadingAnchor, constant: 15),
            sellerIcon.heightAnchor.constraint(equalToConstant: 24),
            sellerIcon.widthAnchor.constraint(equalToConstant: 24),
            
            sellerLabel.centerYAnchor.constraint(equalTo: sellerIcon.centerYAnchor),
            sellerLabel.leadingAnchor.constraint(equalTo: sellerIcon.trailingAnchor, constant: 8),
            
            saleContainer.centerYAnchor.constraint(equalTo: sellerIcon.centerYAnchor),
            saleContainer.trailingAnchor.constraint(equalTo: sellerContainer.trailingAnchor, constant: -15),
            saleContainer.heightAnchor.constraint(equalToConstant: 36),
            
            saleLabel.centerYAnchor.constraint(equalTo: saleContainer.centerYAnchor),
            saleLabel.leadingAnchor.constraint(equalTo: saleContainer.leadingAnchor, constant: 10),
            saleLabel.trailingAnchor.constraint(equalTo: saleContainer.trailingAnchor, constant: -10),
            
            
            // buyer container
            buyerContainer.topAnchor.constraint(equalTo: sellerContainer.bottomAnchor, constant: 15),
            buyerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            buyerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            buyerContainer.heightAnchor.constraint(equalToConstant: 72),
            
            buyerIcon.centerYAnchor.constraint(equalTo: buyerContainer.centerYAnchor),
            buyerIcon.leadingAnchor.constraint(equalTo: buyerContainer.leadingAnchor, constant: 15),
            buyerIcon.heightAnchor.constraint(equalToConstant: 24),
            buyerIcon.widthAnchor.constraint(equalToConstant: 24),
            
            buyerLabel.centerYAnchor.constraint(equalTo: buyerIcon.centerYAnchor),
            buyerLabel.leadingAnchor.constraint(equalTo: buyerIcon.trailingAnchor, constant: 8),
            
            purchaseContainer.centerYAnchor.constraint(equalTo: buyerIcon.centerYAnchor),
            purchaseContainer.trailingAnchor.constraint(equalTo: buyerContainer.trailingAnchor, constant: -15),
            purchaseContainer.heightAnchor.constraint(equalToConstant: 36),
            
            purchaseLabel.centerYAnchor.constraint(equalTo: purchaseContainer.centerYAnchor),
            purchaseLabel.leadingAnchor.constraint(equalTo: purchaseContainer.leadingAnchor, constant: 10),
            purchaseLabel.trailingAnchor.constraint(equalTo: purchaseContainer.trailingAnchor, constant: -10),
            
        ])
    }
    
    func setupAttributedText(_ text1: String, _ text2: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: Color.dark_grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        return text
    }
}
