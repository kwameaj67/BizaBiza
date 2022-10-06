//
//  WalletBalanceCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class WalletBalanceCollectionCell: UICollectionViewCell {
    
    static let reusableId = "WalletBalanceCollectionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let balanceLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let balanceTypeLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: Font.medium.rawValue, size: 18)
        lb.textColor = .white.withAlphaComponent(0.9)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
   
    func setupViews(){
        addSubview(stackView)
        stackView.addArrangedSubview(balanceTypeLabel)
        stackView.addArrangedSubview(balanceLabel)

    }
    func setupContraints(){
       
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 68),
        ])
    }
    func setup(for item: Wallet){
        balanceTypeLabel.text = String(item.balanceType.rawValue)
      
        switch item.balanceType{
        case .ghc:
            balanceLabel.attributedText = setupAttributedText("GH₵ ", "\(item.balance)")
        case .usd:
            balanceLabel.attributedText = setupAttributedText("$", "\(item.balance)")
        case .total:
            balanceLabel.attributedText =  setupAttributedText("GH₵ ", "\(item.balance)")

        }
    }
    
    func setupAttributedText(_ currency : String, _ balance: String) -> NSAttributedString{
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: currency, attributes: [NSAttributedString.Key.baselineOffset: 5,NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 12)!]))
        text.append(NSAttributedString(string: balance, attributes: [NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 24)!]))
        return text
    }
}
