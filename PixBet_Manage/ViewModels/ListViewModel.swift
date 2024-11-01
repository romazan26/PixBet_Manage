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
    
    //MARK: - Authlete Propertyes
    @Published var atheletes: [Athlet] = []
    
    @Published var isEditAthelete: Bool = false
    @Published var simpleAthelete: Athlet?
    
    @Published var simpleName: String = ""
    @Published var simpleGender: Bool = false
    @Published var simpleAge: String = ""
    @Published var simpleHeight: String = ""
    @Published var simpleWeight: String = ""
    @Published var description: String = ""
    @Published var simpleImage: UIImage?
    
    //MARK: - Groups propertyes
    @Published var groups: [Group] = []
    @Published var simpleGroup: Group?
    
    @Published var isPresentEditGroup: Bool = false
    @Published var isEditGroup: Bool = false
    @Published var simpleAtheletesGroup: [Athlet] = []
    @Published var simpleTitleGroup: String = ""
    @Published var simpleDescriptionGroup: String = ""
    
    init(){
        getAtheletes()
        getGroup()
    }
    
    
    //MARK: - Edit data
    func changeTheGroupData(){
        let editGroup = groups.first(where: { $0.id == simpleGroup?.id })
        editGroup?.title = simpleTitleGroup
        editGroup?.descript = simpleDescriptionGroup
        for simpleAtheletes in simpleAtheletesGroup{
            simpleAtheletes.group = editGroup
            saveAtheletes()
        }
        saveGroups()
        clearGroup()
    }
    
    func changeTheAtheleteData(){
        let editAthlete = atheletes.first(where: { $0.id == simpleAthelete?.id })
        editAthlete?.name = simpleName
        editAthlete?.gender = simpleGender
        editAthlete?.age = Int16(simpleAge) ?? 0
        editAthlete?.height = Int16(simpleHeight) ?? 0
        editAthlete?.weight = Int16(simpleWeight) ?? 0
        editAthlete?.descript = description
        editAthlete?.foto = simpleImage
        saveAtheletes()
        clearAtheletes()
        isEditAthelete = false
    }
    
    //MARK: - Feel data
    func getAtheletesListForGroup(group: Group){
        simpleAtheletesGroup.removeAll()
        for athelete in atheletes{
            if athelete.group == group{
                simpleAtheletesGroup.append(athelete)
            }
        }
    }
    
    func getEditedGroup(group: Group){
        simpleTitleGroup = group.title ?? ""
        simpleDescriptionGroup = group.descript ?? ""
        if simpleAtheletesGroup.isEmpty{
            getAtheletesListForGroup(group: group)
        }
        
    }
    
    func getEditedAthlete(athlete: Athlet){
        simpleName = athlete.name ?? ""
        simpleGender = athlete.gender
        simpleAge = String(athlete.age)
        simpleHeight = String(athlete.height)
        simpleWeight = String(athlete.weight)
        description = athlete.descript ?? ""
        simpleImage = athlete.foto
    }
    
    //MARK: Add elemen of simpleAtheletesGroup
    func addOrDeleteAthelesOfgroup(addAthlete: Athlet){
        if simpleAtheletesGroup.contains(addAthlete){
            let removeAtheletes = simpleAtheletesGroup.firstIndex(of: addAthlete)
            simpleAtheletesGroup.remove(at: removeAtheletes!)
        }else{
            simpleAtheletesGroup.append(addAthlete)
        }
    }
    func getCheakMark(athlete: Athlet) -> Bool{
        if simpleAtheletesGroup.contains(athlete){
            return true
        }else {
            return false
        }
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
        saveAtheletes()
        clearAtheletes()
    }
    
    func addGroup() {
        let newGroup = Group(context: manager.context)
        newGroup.title = simpleTitleGroup
        newGroup.descript = simpleDescriptionGroup
        for simpleAtheletes in simpleAtheletesGroup{
            simpleAtheletes.group = newGroup
            saveAtheletes()
        }
        saveGroups()
        clearGroup()
    }
    
    //MARK: - Delete data
    func deleteAtheletes(athlete: Athlet) {
        manager.context.delete(athlete)
        saveAtheletes()
    }
    
    func deleteGroup(group: Group) {
        manager.context.delete(group)
        saveGroups()
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
    
    func getGroup() {
        let request = NSFetchRequest<Group>(entityName: "Group")
        do{
            groups = try manager.context.fetch(request)
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
    func saveGroups() {
        groups.removeAll()
        manager.save()
        getGroup()
    }
    
    //MARK: - Clear data
    func clearAtheletes() {
        simpleName = ""
        simpleGender = false
        simpleAge = ""
        simpleHeight = ""
        simpleWeight = ""
        description = ""
        simpleImage = nil
    }
    
    func clearGroup() {
        simpleTitleGroup = ""
        simpleDescriptionGroup = ""
    }
}
