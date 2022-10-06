//
//  TransactionListCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 24/09/2022.
//

import UIKit

class TransactionListCell: UITableViewCell {

    static let reusableId = "TransactionListCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TransactionListCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let emptyImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "empty-state")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let emptyLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey.withAlphaComponent(0.7)
        lb.text = "Your transactions will show here when you create an agreement"
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(emptyImage)
        stackView.addArrangedSubview(emptyLabel)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 170),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            
          
            
            emptyImage.heightAnchor.constraint(equalToConstant: 100),
            emptyImage.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
        ])
    }
}
