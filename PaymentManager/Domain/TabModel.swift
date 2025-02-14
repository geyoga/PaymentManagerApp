//
//  TabModel.swift
//  PaymentManager
//
//  Created by Georgius Yoga on 14/2/25.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case primary = "Primary"
    case transaction = "Transactions"
    case update = "Updates"
    case promotions = "Promotions"
    case allMails = "All Mails"

    var color: Color {
        switch self {
        case .primary:
                .blue
        case .transaction:
                .green
        case .update:
                .indigo
        case .promotions:
                .pink
        case .allMails:
                .primary
        }
    }
    
    var symbolImage: String {
        switch self {
        case .primary:
            "person"
        case .transaction:
            "cart"
        case .update:
            "text.bubble"
        case .promotions:
            "megaphone"
        case .allMails:
            "tray"
        }
    }
}
