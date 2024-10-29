//
//  AddInfoUserView.swift
//  PixBet_Manage
//
//  Created by Роман on 29.10.2024.
//

import SwiftUI

struct AddInfoUserView: View {
    @StateObject var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Image user
                if let selectedImage = vm.selectedImage {
                    Button {
                        vm.showImagePicker = true
                    } label: {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    }
                } else {
                    Button {
                        vm.showImagePicker = true
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundStyle(.gray)
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(100)
                            .padding()
                    }
                }
                
                //MARK: - User name
                VStack(alignment: .leading) {
                    Text("User name")
                        .foregroundStyle(.gray)
                    TextField("Enter your name", text: $vm.name)
                        .foregroundStyle(.white)
                        .padding()
                        .focused($keyboardFocus)
                        .background {
                            Color.white.opacity(0.05).cornerRadius(15)
                        }
                }
                
                //MARK: - Position user
                VStack(alignment: .leading) {
                    Text("Position")
                        .foregroundStyle(.gray)
                    TextField("Enter your position", text: $vm.position)
                        .foregroundStyle(.white)
                        .focused($keyboardFocus)
                        .padding()
                        .background {
                            Color.white.opacity(0.05).cornerRadius(15)
                        }
                }
                HStack{
                    //MARK: - Age user
                    VStack(alignment: .leading) {
                        Text("Age")
                            .foregroundStyle(.gray)
                        TextField("Enter your age", text: $vm.age)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.white)
                            .focused($keyboardFocus)
                            .padding()
                            .background {
                                Color.white.opacity(0.05).cornerRadius(15)
                            }
                    }
                    
                    //MARK: - Experience user
                    VStack(alignment: .leading) {
                        Text("Experience")
                            .foregroundStyle(.gray)
                        TextField("Enter your experience (years)", text: $vm.experience)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.white)
                            .focused($keyboardFocus)
                            .padding()
                            .background {
                                Color.white.opacity(0.05).cornerRadius(15)
                            }
                    }
                }
                
                Spacer()
                
                //MARK: - Save button
                if let ageInt = Int(vm.age), let experienceInt = Int(vm.experience) {
                    Button {
                        
                        vm.updateUser(name: vm.name, photo: vm.selectedImage, position: vm.position, age: ageInt, experience: experienceInt)
                        dismiss()
                        
                    } label: {
                        CustomButtonView(text: "Save")
                    }
                }else {
                    CustomButtonView(text: "Save").opacity(0.5)
                }
            }
            .colorScheme(.dark)
            .padding()
            .onAppear {
                if let user = vm.user {
                    vm.name = user.name
                    vm.position = user.position
                    vm.age = String(user.age)
                    vm.experience = String(user.experience)
                    if let photoData = user.photo {
                        vm.selectedImage = UIImage(data: photoData)
                    }
                }
            }
            .sheet(isPresented: $vm.showImagePicker) {
                ImagePicker(image: $vm.selectedImage)
            }
        }
        .onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    AddInfoUserView(vm: HomeViewModel())
}
