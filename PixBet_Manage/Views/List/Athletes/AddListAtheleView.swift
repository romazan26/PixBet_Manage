//
//  AddListAtheleView.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct AddListAtheleView: View {
    
    @StateObject var vm: ListViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                Text("Add")
                    .foregroundStyle(.white)
                    .font(.title2)
                ScrollView{
                    VStack{
                        //MARK: - Image user
                        if let selectedImage = vm.simpleImage {
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
                            TextField("Enter your name", text: $vm.simpleName)
                                .foregroundStyle(.white)
                                .padding()
                                .focused($keyboardFocus)
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(15)
                                }
                        }
                        
                        //MARK: - User gender
                        VStack(alignment: .leading) {
                            Text("Complexity")
                                .foregroundStyle(.gray)
                            HStack{
                                //MARK: Man
                                HStack{
                                    Image(systemName: vm.simpleGender ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(vm.simpleGender ? .blue : .white)
                                    Text("Men")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17, weight: .bold))
                                    Spacer()
                                }
                                .onTapGesture {
                                    vm.simpleGender = true
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(32)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 32)
                                                .stroke(.greenApp, lineWidth: 2.0)
                                                .opacity(vm.simpleGender ? 1 : 0)
                                        }
                                }
                                
                                //MARK: Woomen
                                HStack{
                                    Image(systemName: !vm.simpleGender ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(!vm.simpleGender ? .blue : .white)
                                    Text("Woomen")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 17, weight: .bold))
                                    Spacer()
                                }
                                .onTapGesture {
                                    vm.simpleGender = false
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(32)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 32)
                                                .stroke(.greenApp, lineWidth: 2.0)
                                                .opacity(!vm.simpleGender ? 1 : 0)
                                        }
                                }
                            }
                        }
                        
                        //MARK: - Description
                        VStack(alignment: .leading){
                            Text("Description")
                                .foregroundStyle(.gray)
                            MultiLineTF(txt: $vm.description, placehold: "Text here")
                                .padding(10)
                                .background(Color.white.opacity(0.05).cornerRadius(12))
                                .frame(height: 160)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white
                        .opacity(0.05)
                        .cornerRadius(12))
                    
                    HStack{
                        //MARK: - User age
                        VStack(alignment: .leading) {
                            Text("Age")
                                .foregroundStyle(.gray)
                            TextField("0", text: $vm.simpleAge)
                                .foregroundStyle(.white)
                                .keyboardType(.numberPad)
                                .padding()
                                .focused($keyboardFocus)
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(15)
                                }
                        }
                        
                        //MARK: - User weught
                        VStack(alignment: .leading) {
                            Text("Weight")
                                .foregroundStyle(.gray)
                            TextField("0", text: $vm.simpleWeight)
                                .foregroundStyle(.white)
                                .keyboardType(.numberPad)
                                .padding()
                                .focused($keyboardFocus)
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(15)
                                }
                        }
                        
                        //MARK: - User Heaight
                        VStack(alignment: .leading) {
                            Text("Height")
                                .foregroundStyle(.gray)
                            TextField("0", text: $vm.simpleHeight)
                                .foregroundStyle(.white)
                                .keyboardType(.numberPad)
                                .padding()
                                .focused($keyboardFocus)
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(15)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white
                        .opacity(0.05)
                        .cornerRadius(12))
                    
                    //MARK: - Save button
                    Button {
                        if vm.isEditAthelete{
                            vm.changeTheAtheleteData()
                        }else{
                            vm.addAtheletes()
                        }
                        dismiss()
                    } label: {
                        CustomButtonView(text: "Save")
                    }
                    
                }
                .colorScheme(.dark)
                .padding()
            }
        }
        .onTapGesture(perform: {
            keyboardFocus = false
        })
        .sheet(isPresented: $vm.showImagePicker) {
            ImagePicker(image: $vm.simpleImage)
        }
    }
}

#Preview {
    AddListAtheleView(vm: ListViewModel())
}
