//
//  InstantPaymentCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class InstantPaymentCell: UITableViewCell {

    static let reusableId = "InstantPaymentCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BizaPaymentOptionCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    lazy var sendViewBtn: InstantOptionView = {
        let view = InstantOptionView()
        view.iconContainer.backgroundColor = Color.blue
        view.icon.image = UIImage(named: "card-white")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        view.arrow.image = UIImage(named: "arrow-right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var payViewBtn: InstantOptionView = {
        let view = InstantOptionView()
        view.iconContainer.backgroundColor = Color.violet
        view.icon.image = UIImage(named: "flash")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        view.arrow.image = UIImage(named: "arrow-right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    func setupViews(){
        contentView.addSubview(sendViewBtn)
        contentView.addSubview(payViewBtn)
        
        // attributedText
        sendViewBtn.title.attributedText = setupAttributedText("Send Agreement", "Buy and sell safely with escrow")
        payViewBtn.title.attributedText = setupAttributedText("Pay Bills", "Buy and sell safely with escrow")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            sendViewBtn.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            sendViewBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            sendViewBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            
            payViewBtn.topAnchor.constraint(equalTo: sendViewBtn.bottomAnchor,constant: 80),
            payViewBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            payViewBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            
        ])
    }
    
    func setupAttributedText(_ title: String, _ subTitle: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title)\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: "\(subTitle)", attributes: [NSAttributedString.Key.foregroundColor:Color.grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 14)!]))
        return text
    }

}
