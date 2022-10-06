//
//  WalletBalanceView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import UIKit

class WalletBalanceCell: UITableViewCell {
    
    let balanceData = Wallet.walletData
    static let reusableId = "WalletBalanceCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WalletBalanceCell.reusableId)
        setupViews()
        setupContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let walletTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Current balance"
        lb.font = UIFont(name: Font.medium.rawValue, size: 17)
        lb.textColor = .black
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    lazy var balanceCollectionView : UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = Color.blue
        cv.register(WalletBalanceCollectionCell.self, forCellWithReuseIdentifier: WalletBalanceCollectionCell.reusableId)
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
    let pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.pageIndicatorTintColor = .lightGray
        pg.currentPageIndicatorTintColor = .white
        pg.pageIndicatorTintColor = .systemGray4
        pg.currentPage = 0
        pg.numberOfPages = 3
        pg.translatesAutoresizingMaskIntoConstraints = false
        return pg
    }()
    // background images
    let image_bg1 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s1")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg2 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s2")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg3 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s3")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg4 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s4")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg5 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s5")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg6 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s6")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let image_bg7 : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "s7")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    func setupViews(){
        contentView.addSubview(walletTitleLabel)
        contentView.addSubview(balanceCollectionView)
        contentView.addSubview(pageControl)
        
        [image_bg1,image_bg2,image_bg3,image_bg4,image_bg5,image_bg6,image_bg7].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // size of pageControl dots
        pageControl.subviews.forEach { item in
            item.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    func setupContraints(){
        [image_bg1,image_bg2,image_bg3,image_bg4,image_bg5,image_bg6,image_bg7].forEach {
            $0.widthAnchor.constraint(equalToConstant: 25).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 25).isActive = true
        }
        NSLayoutConstraint.activate([
            walletTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            walletTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            balanceCollectionView.topAnchor.constraint(equalTo: walletTitleLabel.bottomAnchor, constant: 25),
            balanceCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 50),
            balanceCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -50),
            balanceCollectionView.heightAnchor.constraint(equalToConstant: 145),
            
            pageControl.topAnchor.constraint(equalTo: balanceCollectionView.bottomAnchor, constant: -40),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           
            
            // background image constraints
            image_bg1.centerYAnchor.constraint(equalTo: balanceCollectionView.centerYAnchor),
            image_bg1.leadingAnchor.constraint(equalTo: balanceCollectionView.leadingAnchor, constant: 30),

            image_bg2.bottomAnchor.constraint(equalTo: balanceCollectionView.bottomAnchor, constant: -10),
            image_bg2.trailingAnchor.constraint(equalTo: balanceCollectionView.trailingAnchor, constant: -40),

            image_bg3.topAnchor.constraint(equalTo: balanceCollectionView.topAnchor, constant: 10),
            image_bg3.leadingAnchor.constraint(equalTo: balanceCollectionView.leadingAnchor, constant: 30),

            image_bg4.centerYAnchor.constraint(equalTo: balanceCollectionView.centerYAnchor),
            image_bg4.centerXAnchor.constraint(equalTo: balanceCollectionView.centerXAnchor),

            image_bg5.bottomAnchor.constraint(equalTo: balanceCollectionView.bottomAnchor, constant: -10),
            image_bg5.leadingAnchor.constraint(equalTo: balanceCollectionView.leadingAnchor, constant: 90),

            image_bg6.topAnchor.constraint(equalTo: balanceCollectionView.topAnchor, constant: 20),
            image_bg6.trailingAnchor.constraint(equalTo: balanceCollectionView.trailingAnchor, constant: -90),

            image_bg7.centerYAnchor.constraint(equalTo: balanceCollectionView.centerYAnchor),
            image_bg7.trailingAnchor.constraint(equalTo: balanceCollectionView.trailingAnchor, constant: -20),
            
        ])
    }
}

extension WalletBalanceCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return balanceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletBalanceCollectionCell.reusableId, for: indexPath) as! WalletBalanceCollectionCell
        cell.setup(for: balanceData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int( x / balanceCollectionView.frame.width)
//        self.pageControl.subviews[self.pageControl.currentPage].transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
    
}
