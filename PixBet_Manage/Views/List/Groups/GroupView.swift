//
//  GroupView.swift
//  PixBet_Manage
//
//  Created by Роман on 30.10.2024.
//

import SwiftUI

struct GroupView: View {
    @StateObject var vm: ListViewModel
    @ObservedObject var group: Group
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Title of group
                HStack {
                    Text(group.title ?? "")
                        .foregroundStyle(.white)
                        .font(.title)
                        
                    Spacer()
                }
                
                ScrollView{
                    //MARK: - Image of group
                    Image(.medal)
                        .resizable()
                        .foregroundStyle(.gray)
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                    
                    //MARK: - Descripton of grup
                    Text(group.descript ?? "")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                    
                    //MARK: - Athletes
                    if !vm.simpleAtheletesGroup.isEmpty {
                        VStack{
                            //MARK: - List athlete
                            ForEach(vm.simpleAtheletesGroup) { athlete in
                                AthleteCellOfGroup(athlete: athlete)
                            }
                        }
                        .padding()
                        .background(Color.white
                            .opacity(0.05)
                            .cornerRadius(12))
                    }
                    
                    
                }
                Spacer()
                
                //MARK: - Delete button
                Button {
                    vm.deleteGroup(group: group)
                } label: {
                    CustomButtonView(text: "Delete", color: .second)
                }

            }.padding()
        }
    }
}

#Preview {
    GroupView(vm: ListViewModel(), group: Group())
}
