//
//  TransactionCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class TransactionCell: UITableViewCell {

    static let reusableId = "TransactionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TransactionCell.reusableId)
        setupViews()
        setupConstraints()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let totalTransactionLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.text = "12 total transactions today"
        lb.textColor = Color.grey
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let borderTop: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let borderBottom: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let viewBtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("View all", for: .normal)
        btn.setTitleColor(Color.light_blue, for: .normal)
        btn.setImage(UIImage(named: "arrow-right")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 15)
        btn.semanticContentAttribute = .forceRightToLeft
        btn.backgroundColor = .none
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    func setupViews(){
        contentView.addSubview(borderTop)
        contentView.addSubview(borderBottom)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(totalTransactionLabel)
        stackView.addArrangedSubview(viewBtn)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            borderTop.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderTop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderTop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            borderTop.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.topAnchor.constraint(equalTo: borderTop.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            stackView.bottomAnchor.constraint(equalTo: borderBottom.topAnchor,constant: -10),
            
            totalTransactionLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            totalTransactionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            viewBtn.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            viewBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            viewBtn.widthAnchor.constraint(equalToConstant: 76),
            
            borderBottom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            borderBottom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderBottom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

}
