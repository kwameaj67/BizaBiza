//
//  Wallet.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 23/09/2022.
//

import Foundation

enum BalanceType : String {
    case usd = "USD Balance"
    case ghc = "Cedis Balance"
    case total = "Total Balance"
}
struct Wallet {
    var balanceType: BalanceType
    var balance: Double
    
    static let walletData: [Wallet] = [
        Wallet(balanceType: .total, balance: 0.00),
        Wallet(balanceType: .usd, balance: 0.00),
        Wallet(balanceType: .ghc, balance: 0.00),
    ]
}
