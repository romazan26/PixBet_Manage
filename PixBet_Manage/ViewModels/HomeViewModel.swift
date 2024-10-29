//
//  HomeViewModel.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//
import SwiftUI

struct User: Codable {
    var name: String
    var photo: Data?
    var position: String
    var age: Int
    var experience: Int
}

final class HomeViewModel: ObservableObject {
    @Published var isOn: Bool = false
    
    @Published var name: String = ""
    @Published var position: String = ""
    @Published var age: String = ""
    @Published var experience: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var showImagePicker = false
    
    @Published var user: User? {
           didSet {
               saveUser()
           }
       }
       
       init() {
           loadUser()
       }
       
    //MARK: - User Default
       private func saveUser() {
           guard let user = user else { return }
           
           if let encodedUser = try? JSONEncoder().encode(user) {
               UserDefaults.standard.set(encodedUser, forKey: "user")
           }
       }
       
       private func loadUser() {
           if let savedUserData = UserDefaults.standard.data(forKey: "user"),
              let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
               user = decodedUser
           }
       }
       
       func updateUser(name: String, photo: UIImage?, position: String, age: Int, experience: Int) {
           let photoData = photo?.jpegData(compressionQuality: 0.8)
           user = User(name: name, photo: photoData, position: position, age: age, experience: experience)
       }
}
