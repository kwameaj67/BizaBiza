//
//  PaymentOptionCollectionCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class PageOptionCollectionCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.title.textColor = self.isSelected ? .black : Color.dark_grey
                self.border.alpha = self.isSelected ? 1 : 0
                self.border.isHidden = self.isSelected ? false : true
                
            }
        }
    }
    
    static let reusableId = "PageOptionCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(border)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.dark_grey
        lb.font = UIFont(name: Font.medium.rawValue, size: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let border: UIView = {
        let b = UIView()
        b.backgroundColor = .black
        b.layer.cornerRadius = 3/2
        b.alpha = 0
        b.isHidden = true
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            border.bottomAnchor.constraint(equalTo: bottomAnchor),
            border.leadingAnchor.constraint(equalTo: leadingAnchor),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}
