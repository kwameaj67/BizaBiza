//
//  TabBarVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 20/09/2022.
//

import UIKit

class TabBarVC: UITabBarController {

    private var tabItem = UITabBarItem()
    private var tabBarAppearance = UITabBar.appearance()
    private var tabBarItemAppearance = UITabBarItem.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let HomeVC = UINavigationController(rootViewController: HomeVC())
        let EscrowVC = UINavigationController(rootViewController: EscrowVC())
        let PaymentVC = UINavigationController(rootViewController: PaymentVC())
        let ShopVC = UINavigationController(rootViewController: ShopVC())
        let SettingsVC = UINavigationController(rootViewController: SettingsVC())
        
        let tabBarControllers = [HomeVC, EscrowVC, PaymentVC, ShopVC, SettingsVC]
        
        setupTabBarViews()
        
        viewControllers = tabBarControllers
        
        // tabs
        setupTabItem("home-selected", "home-deselected", 0, "Home")
        setupTabItem("escrow-selected", "escrow-deselected", 1, "Escrow")
        setupTabItem("payment-selected", "payment-deselected", 2, "Payments")
        setupTabItem("shop-selected", "shop-deselected", 3, "Shop")
        setupTabItem("setting-selected", "setting-deselected", 4, "Settings")
        
        tabBar.standardAppearance.shadowColor = nil
        
        // shadows
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        tabBar.layer.shadowRadius = 3.0
        tabBar.layer.shadowOffset =  CGSize(width: 0, height: -3)
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.borderWidth = 0
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = false
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white

    }
    
    func setupTabBarViews(){
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = true
        
        tabBarAppearance.tintColor = Color.blue
        tabBarAppearance.unselectedItemTintColor = Color.grey
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //print(tabBar.frame.size.height)
        tabBar.frame.origin.y = view.frame.height - 100
    }
    
    func setupTabItem(_ activeImage: String, _ inActiveImage: String, _ index: Int, _ tabTitle: String){
        let selectedImage = UIImage(named: activeImage)?.withRenderingMode(.alwaysTemplate)
        let deSelectedImage = UIImage(named: inActiveImage)?.withRenderingMode(.alwaysTemplate)
        
        tabItem = self.tabBar.items![index]
        tabItem.image = deSelectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = tabTitle
        tabItem.imageInsets.bottom = -5
        tabItem.imageInsets = UIEdgeInsets(top: -2, left: -10, bottom: 2, right: -10)
        tabItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -10)
    }
    override var selectedIndex: Int {
        didSet {
            guard let _ = viewControllers?[selectedIndex] else { return }
            tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 14)!,NSAttributedString.Key.foregroundColor:Color.blue], for: .normal)
        }
    }
    override var selectedViewController: UIViewController? {
        didSet{
            guard let viewControllers = viewControllers else { return }
            for viewVC in viewControllers{
                if viewVC == selectedViewController {
                    tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 14)!,NSAttributedString.Key.foregroundColor:Color.blue], for: .normal)
                }
                else {
                    tabBarItemAppearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 14)!,NSAttributedString.Key.foregroundColor:Color.grey], for: .normal)
                }
            }
        }
    }
    
}
