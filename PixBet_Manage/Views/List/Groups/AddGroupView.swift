//
//  AddGroupView.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct AddGroupView: View {
    
    @StateObject var vm: ListViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack {
                        //MARK: - Image
                        Image(.medal)
                            .resizable()
                            .foregroundStyle(.gray)
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .cornerRadius(100)
                            .padding()
                        
                        //MARK: - title of group
                        VStack(alignment: .leading) {
                            Text("Title")
                                .foregroundStyle(.gray)
                            TextField("Enter title", text: $vm.simpleTitleGroup)
                                .foregroundStyle(.white)
                                .padding()
                                .focused($keyboardFocus)
                                .background {
                                    Color.white.opacity(0.05).cornerRadius(15)
                                }
                            
                            //MARK: - Description
                            VStack(alignment: .leading){
                                Text("Description")
                                    .foregroundStyle(.gray)
                                MultiLineTF(txt: $vm.simpleDescriptionGroup, placehold: "Text here")
                                    .padding(10)
                                    .frame(height: 160)
                                    .background(Color.white.opacity(0.05).cornerRadius(12))
                            }
                        }
                    }
                    .padding()
                    .background(Color.white
                        .opacity(0.05)
                        .cornerRadius(12))
                    
                    //MARK: - Athletes
                    VStack{
                        
                        //MARK: - Add athlete button
                        NavigationLink {
                            ChooseAthleteOfGroupeView(vm: vm)
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                
                                Text("Add an athlete")
                            }
                            .font(.system(size: 17, weight: .bold))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.white
                                .opacity(0.05)
                                .cornerRadius(12))
                        }
                        
                        //MARK: - List athlete
                        ForEach(vm.simpleAtheletesGroup) { athlete in
                            AthleteCellOfGroup(athlete: athlete)
                        }
                    }
                    .padding()
                    .background(Color.white
                        .opacity(0.05)
                        .cornerRadius(12))
                    
                    Spacer()
                    
                    Button {
                        vm.addGroup()
                        dismiss()
                    } label: {
                        CustomButtonView(text: "Save")
                    }
                    
                }.padding()
            }
            
            
        }
        .colorScheme(.dark)
        .onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    AddGroupView(vm: ListViewModel())
}
