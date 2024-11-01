//
//  EnumComplexityTraining.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

enum ComplexityTraining: CaseIterable, Identifiable {
    case easy
    case average
    case hard
    
    var id: Self { self }
    
    var tite: String {
        switch self {
        case .easy: return "Easy"
        case .average: return "Average"
        case .hard: return "Hard"
        }
    }
}
