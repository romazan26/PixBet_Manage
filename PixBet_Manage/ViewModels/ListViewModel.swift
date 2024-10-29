//
//  ListViewModel.swift
//  PixBet_Manage
//
//  Created by Роман on 29.10.2024.
//

import Foundation
import CoreData
import UIKit

final class ListViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var isChooseView: Bool = true
    @Published var showImagePicker = false
    
    @Published var atheletes: [Athlet] = []
    
    @Published var simpleName: String = ""
    @Published var simpleGender: Bool = false
    @Published var simpleAge: String = ""
    @Published var simpleHeight: String = ""
    @Published var simpleWeight: String = ""
    @Published var description: String = ""
    @Published var simpleImage: UIImage?
    
    init(){
        getAtheletes()
    }
    
    //MARK: - Add data
    func addAtheletes() {
        let newAtheletes = Athlet(context: manager.context)
        newAtheletes.name = simpleName
        newAtheletes.age = Int16(simpleAge) ?? 0
        newAtheletes.descript = description
        newAtheletes.gender = simpleGender
        newAtheletes.height = Int16(simpleHeight) ?? 0
        newAtheletes.weight = Int16(simpleWeight) ?? 0
        guard let image = simpleImage else { return }
        newAtheletes.foto = image
    }
    
    //MARK: - Get data
    func getAtheletes() {
        let request = NSFetchRequest<Athlet>(entityName: "Athlet")
        do{
            atheletes = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching data: \(error)")
        }
    }
    
    //MARK: - Save data
    func saveAtheletes() {
        atheletes.removeAll()
        manager.save()
        getAtheletes()
    }
    
}
