//
//  PaymentVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class PaymentVC: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Payments"
        setupNavigationBar()
        setupViews()
        setupContraints()
    }
    
    
    
    func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Color.blue
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 20)!,NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        // hide nav line
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
   
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero,style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(PaymentOptionsCell.self, forCellReuseIdentifier: PaymentOptionsCell.reusableId)
        tv.register(BizaPaymentOptionCell.self, forCellReuseIdentifier: BizaPaymentOptionCell.reusableId)
        tv.register(RecentPaymentCell.self, forCellReuseIdentifier: RecentPaymentCell.reusableId)
        tv.register(InstantPaymentCell.self, forCellReuseIdentifier: InstantPaymentCell.reusableId)
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
        view.addSubview(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PaymentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentOptionsCell.reusableId, for: indexPath) as! PaymentOptionsCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: BizaPaymentOptionCell.reusableId, for: indexPath) as! BizaPaymentOptionCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentPaymentCell.reusableId, for: indexPath) as! RecentPaymentCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: InstantPaymentCell.reusableId, for: indexPath) as! InstantPaymentCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        }
        if indexPath.row == 1 {
            return 200
        }
        else  if indexPath.row == 2 {
            return 150
        }
        else  if indexPath.row == 3 {
            return 200
        }
        return CGFloat()
    }
    
    
}
