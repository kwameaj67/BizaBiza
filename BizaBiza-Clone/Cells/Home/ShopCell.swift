//
//  ShopCollectionCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class ShopCell: UITableViewCell {
    static let reusableId = "ShopCell"
    private let shopList = Shop.shopData
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ShopCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Shop"
        lb.font = UIFont(name: Font.medium.rawValue, size: 24)
        lb.textColor = .black
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var shopCollectionView : UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = .clear
        cv.register(ShopCollectionCell.self, forCellWithReuseIdentifier: ShopCollectionCell.reusableId)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.isScrollEnabled = true
        cv.bounces = true
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.layer.cornerRadius = 12
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(shopCollectionView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            shopCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            shopCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shopCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shopCollectionView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}

extension ShopCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionCell.reusableId, for: indexPath) as! ShopCollectionCell
        cell.setup(for: shopList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 20)
    }
}
