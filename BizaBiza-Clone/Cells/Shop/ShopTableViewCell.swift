//
//  ShopCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 26/09/2022.
//

import UIKit
import Cosmos

class ShopTableViewCell: UITableViewCell {
    static let reusableId = "ShopTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ShopTableViewCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let typeContainer: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let typeLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let shopIcon : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "shop-blue")?.withRenderingMode(.alwaysOriginal)
            .withTintColor(Color.blue)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let locationLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let orderNumberLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.numberOfLines = 0
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let ratingLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let userRatingLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = Color.grey
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let arrowIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image =  UIImage(named: "arrow-right")?.withRenderingMode(.alwaysOriginal).withTintColor(Color.blue)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let starView: CosmosView = {
        let cv = CosmosView()
        cv.settings.updateOnTouch = false
        cv.settings.fillMode = .precise
        cv.settings.starMargin = 5
        cv.settings.starSize = 15
        cv.settings.filledImage = UIImage(named: "star-filled")?.withRenderingMode(.alwaysOriginal)
        cv.settings.emptyImage = UIImage(named: "star-outline")?.withRenderingMode(.alwaysOriginal)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    func setupViews(){
        let view = contentView
        [shopIcon,arrowIcon,starView,ratingLabel,userRatingLabel,locationLabel,typeContainer,titleLabel,orderNumberLabel].forEach {
            view.addSubview($0)
        }
        typeContainer.addSubview(typeLabel)
    }
    func setupConstraints(){
        let view = contentView
        
        NSLayoutConstraint.activate([
            shopIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            shopIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            shopIcon.widthAnchor.constraint(equalToConstant: 22),
            shopIcon.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: shopIcon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: shopIcon.trailingAnchor, constant: 8),
//            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            
            typeContainer.centerYAnchor.constraint(equalTo: shopIcon.centerYAnchor),
            typeContainer.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            typeContainer.heightAnchor.constraint(equalToConstant: 34),
            
            typeLabel.centerYAnchor.constraint(equalTo: typeContainer.centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: typeContainer.leadingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: typeContainer.trailingAnchor, constant: -10),
            
            locationLabel.topAnchor.constraint(equalTo: shopIcon.bottomAnchor, constant: 15),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            locationLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor, constant: -10),
            
            ratingLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            starView.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starView.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 15),
            starView.heightAnchor.constraint(equalToConstant: 15),
            
            userRatingLabel.centerYAnchor.constraint(equalTo: starView.centerYAnchor),
            userRatingLabel.leadingAnchor.constraint(equalTo: starView.trailingAnchor, constant: 15),
            
            orderNumberLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 15),
            orderNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            arrowIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            arrowIcon.widthAnchor.constraint(equalToConstant: 20),
            arrowIcon.heightAnchor.constraint(equalToConstant: 20),
         
        ])
    }
    func setup(for item: BizaShop){
        titleLabel.text = item.title
        locationLabel.text = item.location
        ratingLabel.text = "\(item.rating)"
        userRatingLabel.text = "(\(item.numberOfRatings))"
        orderNumberLabel.text = "\(item.completedOrders) completed orders"
        typeLabel.text = item.type.rawValue
        starView.rating = item.rating
        
        switch item.type {
        case .restaurant:
            typeContainer.backgroundColor = Color.yellow_bg
            typeLabel.textColor = Color.yellow
        case .buka:
            typeContainer.backgroundColor = Color.violet_bg
            typeLabel.textColor = Color.violet
        }
    }
}
