//
//  ShopVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class ShopVC: UIViewController {
    
    private let options = ["Grocery","Food & Drink","Services","Taxi","Delivery","Pickups"]
    private let shopList = BizaShop.bizaShopData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Shop"
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupContraints()
    }

    // MARK: Properties -
    lazy var headerView: ShopHeaderView = {
        let view = ShopHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var notificationView: NotificationView = {
        let view = NotificationView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 30
//        layout.minimumLineSpacing = 30
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = .clear
        cv.register(PageOptionCollectionCell.self, forCellWithReuseIdentifier: PageOptionCollectionCell.reusableId)
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.allowsSelection = true
        cv.bounces = true
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let border: UIView = {
        let view = UIView()
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero,style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ShopTableViewCell.self, forCellReuseIdentifier: ShopTableViewCell.reusableId)
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.allowsMultipleSelection = false
        tv.allowsSelection = false
        tv.separatorColor = Color.border_bg
        tv.separatorStyle = .singleLine
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    func setupViews(){
        view.addSubview(headerView)
        view.addSubview(notificationView)
        view.addSubview(collectionView)
        view.addSubview(border)
        view.addSubview(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 65),
            
            notificationView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            notificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationView.heightAnchor.constraint(equalToConstant: 65),
            
            collectionView.topAnchor.constraint(equalTo: notificationView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 65),
            
            border.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: border.bottomAnchor,constant: 2),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}

extension ShopVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageOptionCollectionCell.reusableId, for: indexPath) as! PageOptionCollectionCell
        cell.title.text = options[indexPath.row]
        cell.border.backgroundColor = Color.blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = options[indexPath.row]
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font:UIFont(name: Font.medium.rawValue, size: 15)!])
        return CGSize(width: itemSize.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: IndexPath(item: indexPath.row, section: 0), at: [.centeredHorizontally,.centeredVertically], animated: true)
        collectionView.layoutSubviews()
    }
}


extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.reusableId, for: indexPath) as! ShopTableViewCell
        cell.setup(for: shopList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(190)
    }
    
    
}
