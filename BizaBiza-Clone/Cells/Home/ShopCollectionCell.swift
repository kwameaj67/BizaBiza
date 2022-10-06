//
//  ShopCollectionCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class ShopCollectionCell: UICollectionViewCell {
    static let reusableId = "ShopCollectionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = Color.border_bg.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let priceLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.light_blue
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let pickupLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let deliveryLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let titleImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "shop-violet")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let pickupImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "location-tick")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let deliveryImage : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "truck-tick")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    func setupViews(){
        [titleLabel,titleImage,priceLabel,pickupLabel,pickupImage,deliveryLabel,deliveryImage].forEach{
            addSubview($0)
        }
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: titleImage.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor),
            
            titleImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleImage.widthAnchor.constraint(equalToConstant: 20),
            titleImage.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            pickupImage.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            pickupImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            pickupImage.widthAnchor.constraint(equalToConstant: 20),
            pickupImage.heightAnchor.constraint(equalToConstant: 20),
            
            pickupLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            pickupLabel.centerYAnchor.constraint(equalTo: pickupImage.centerYAnchor),
            pickupLabel.leadingAnchor.constraint(equalTo: pickupImage.trailingAnchor, constant: 8),
            
            deliveryImage.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 20),
            deliveryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            deliveryImage.widthAnchor.constraint(equalToConstant: 20),
            deliveryImage.heightAnchor.constraint(equalToConstant: 20),
            
            deliveryLabel.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 15),
            deliveryLabel.centerYAnchor.constraint(equalTo: deliveryImage.centerYAnchor),
            deliveryLabel.leadingAnchor.constraint(equalTo: deliveryImage.trailingAnchor, constant: 8),
 
        ])
    }
    
    func setup(for item: Shop){
        titleLabel.text = item.name
        priceLabel.text = item.price
        deliveryLabel.text = item.delivery
        pickupLabel.text = item.pickups
    }
}
