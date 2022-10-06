//
//  BizaPaymentOptionCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class BizaPaymentOptionCell: UITableViewCell {

    static let reusableId = "BizaPaymentOptionCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BizaPaymentOptionCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    lazy var sendViewBtn: BizaOptionView = {
        let view = BizaOptionView()
        view.iconContainer.backgroundColor = Color.light_blue_bg2
        view.icon.image = UIImage(named: "arrow-blue")?.withRenderingMode(.alwaysOriginal).withTintColor(Color.blue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var collectViewBtn: BizaOptionView = {
        let view = BizaOptionView()
        view.iconContainer.backgroundColor = Color.green_bg
        view.icon.image = UIImage(named: "arrow-green")?.withRenderingMode(.alwaysOriginal).withTintColor(Color.green)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews(){
        contentView.addSubview(sendViewBtn)
        contentView.addSubview(collectViewBtn)

        // attributedText
        sendViewBtn.title.attributedText = setupAttributedText("Send Biza", "Send money to anyone for free")
        collectViewBtn.title.attributedText =  setupAttributedText("Collect Biza", "Receive money and more from anyone")

    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            sendViewBtn.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            sendViewBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            sendViewBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            
            collectViewBtn.topAnchor.constraint(equalTo: sendViewBtn.topAnchor,constant: 80),
            collectViewBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            collectViewBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
        ])
    }
    
    func setupAttributedText(_ title: String, _ subTitle: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title)\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: "\(subTitle)", attributes: [NSAttributedString.Key.foregroundColor:Color.grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 14)!]))
        return text
    }
}
