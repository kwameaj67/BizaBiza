//
//  RecentPaymentCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class RecentPaymentCell: UITableViewCell {

    static let reusableId = "RecentPaymentCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: RecentPaymentCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Recent payments"
        lb.textColor = Color.dark_grey
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let paymentTextLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let amountLabel: UILabel = {
        let lb = UILabel()
        lb.text = "GH₵ 300.00"
        lb.textColor = Color.blue
        lb.font = UIFont(name: Font.bold.rawValue, size: 15)
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let eyeIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "eye")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let messageIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "message")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupViews(){
        contentView.addSubview(titleContainer)
        titleContainer.addArrangedSubview(titleLabel)
        titleContainer.addArrangedSubview(eyeIcon)
        
        [messageIcon,paymentTextLabel,amountLabel].forEach {
            contentView.addSubview($0)
        }
        paymentTextLabel.attributedText = setupAttributedText("Send Biza","Bank transfer to OLADIPO VETA...")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            titleContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleContainer.widthAnchor.constraint(equalToConstant: 160),
            
            eyeIcon.heightAnchor.constraint(equalToConstant: 20),
            eyeIcon.widthAnchor.constraint(equalToConstant: 20),
            eyeIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            messageIcon.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 30),
            messageIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            messageIcon.heightAnchor.constraint(equalToConstant: 20),
            messageIcon.widthAnchor.constraint(equalToConstant: 20),
            
            paymentTextLabel.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 30),
            paymentTextLabel.leadingAnchor.constraint(equalTo: messageIcon.trailingAnchor, constant: 20),
          
            
            amountLabel.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 50),
            amountLabel.leadingAnchor.constraint(equalTo: paymentTextLabel.trailingAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
        ])
    }
    func setupAttributedText(_ title: String, _ subTitle: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title)\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: "\(subTitle)", attributes: [NSAttributedString.Key.foregroundColor:Color.grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 14)!]))
        return text
    }
}
