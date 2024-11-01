//
//  EnumTrainngType.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

enum TrainingType: CaseIterable, Identifiable {
    
    case all
    case specific
    case groupClasses
    case flexibilityAndStretching
    case endurance
    case recovery
    case power
    case cardio
    case other
    
    var title: String {
        switch self {
            
        case .all:
            return "All"
        case .specific:
            return "Specific"
        case .groupClasses:
            return "Group classes"
        case .flexibilityAndStretching:
            return "Flexibility and stretching"
        case .endurance:
            return "Endurance"
        case .recovery:
            return "Recovery"
        case .power:
            return "Power"
        case .cardio:
            return "Cardio"
        case .other:
            return "Other"
        }
    }
    
    var id: Self {
        self
    }
}
