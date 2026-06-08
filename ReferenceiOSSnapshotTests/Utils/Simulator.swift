//
//  Simulator.swift
//  ReferenceiOSTests
//
//  Created by Ganjar Manggala on 08/06/2026.
//  Copyright © 2026 ABN AMRO. All rights reserved.
//

import SnapshotTesting

enum Simulator: String {
    case iPhoneSE, iPhone13Pro, iPhone13ProMax
    
    var config: ViewImageConfig {
        switch self {
        case .iPhoneSE: return .iPhoneSe
        case .iPhone13Pro: return .iPhone13Pro
        case .iPhone13ProMax: return .iPhone13ProMax
        }
    }
    
    // 🌟 Tambahkan ini secara manual
    static var allCases: [Simulator] {
        return [.iPhoneSE, .iPhone13Pro, .iPhone13ProMax]
    }
}
