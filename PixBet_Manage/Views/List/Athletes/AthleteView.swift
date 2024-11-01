//
//  AthleteView.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct AthleteView: View {
    @StateObject var vm: ListViewModel
    let athlete: Athlet
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack (spacing: 15){
                //MARK: - Name athlete
                HStack {
                    Text(athlete.name ?? "")
                        .foregroundStyle(.white)
                        .font(.title)
                    Spacer()
                }
                
                //MARK: - Photo athlete
                if let image = athlete.foto {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        
                }else{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundStyle(.gray)
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .cornerRadius(100)
                }
                
                //MARK: - Gender
                Text(athlete.gender ? "Men" : "Women")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background { Color.greenApp.cornerRadius(16) }
                HStack(spacing: 25){
                    //MARK: Age user
                    VStack{
                        Text("Age")
                        Text("\(athlete.age)" )
                    }.foregroundStyle(.white)
                    
                    //MARK: Weight user
                    VStack{
                        Text("Weight")
                        Text("\(athlete.weight)" )
                    }.foregroundStyle(.white)
                    
                    //MARK: Height user
                    VStack{
                        Text("Height")
                        Text("\(athlete.height)" )
                    }.foregroundStyle(.white)
                }
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.second)
                
                
                //MARK: - Description
                Text(athlete.descript ?? "")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                
                HStack {
                    //MARK: - Delete button
                    Button {
                        vm.deleteAtheletes(athlete: athlete)
                    } label: {
                        CustomButtonView(text: "Delete", color: .second)
                    }
                    
                    //MARK: - Edit button
                    NavigationLink {
                        AddListAtheleView(vm: vm)
                            .onAppear {
                                vm.getEditedAthlete(athlete: athlete)
                                vm.isEditAthelete = true
                                vm.simpleAthelete = athlete
                            }
                    } label: {
                        CustomButtonView(text: "Edit")
                    }

                }

            }
            .padding()
        }
    }
}

#Preview {
    AthleteView(vm: ListViewModel(), athlete: Athlet())
}
