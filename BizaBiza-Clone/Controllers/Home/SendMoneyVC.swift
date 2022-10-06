//
//  SendMoneyVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class SendMoneyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Send money"
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Color.blue
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 20)!,NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        // hide nav line
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
}
