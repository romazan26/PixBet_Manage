//
//  ChooseAthleteOfGroupeView.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import SwiftUI

struct ChooseAthleteOfGroupeView: View {
    @StateObject var vm: ListViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                Text("Athletes")
                VStack {
                    ForEach(vm.atheletes) { athlete in
                        ChooseAthleteCellView(choose: vm.getCheakMark(athlete: athlete), athlete: athlete)
                            .onTapGesture {
                                vm.addOrDeleteAthelesOfgroup(addAthlete: athlete)
                            }
                    }
                }
                .padding()
                .background(Color.white
                    .opacity(0.05)
                    .cornerRadius(12))
                
                Spacer()
                
                //MARK: - Save button
                Button {
                    print(vm.simpleAtheletesGroup)
                    dismiss()
                } label: {
                    CustomButtonView(text: "Save")
                }

            }.padding()
            
        }
    }
}

#Preview {
    ChooseAthleteOfGroupeView(vm: ListViewModel())
}
