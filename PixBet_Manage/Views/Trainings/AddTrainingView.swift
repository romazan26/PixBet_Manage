//
//  AddTrainingView.swift
//  PixBet_Manage
//
//  Created by Роман on 01.11.2024.
//

import SwiftUI

struct AddTrainingView: View {
    
    @StateObject var vm: TrainingsViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                Text("Add training")
                    .font(.title)
                ScrollView {
                    //MARK: - Comlexity
                    VStack(alignment: .leading) {
                        Text("Complexity")
                        HStack{
                            ForEach(ComplexityTraining.allCases) { complexity in
                                ComplexityCellView(text: complexity.tite, isSelected: (vm.simpleComplexity == complexity ? true : false))
                                    .onTapGesture {
                                        vm.simpleComplexity = complexity
                                    }
                            }
                        }
                    }
                    VStack {
                        //MARK: - title of training
                        VStack(alignment: .leading) {
                            Text("Title")
                                .foregroundStyle(.gray)
                            TextField("Enter title", text: $vm.simpleTitle)
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
                                MultiLineTF(txt: $vm.simpleDescription, placehold: "Text here")
                                    .padding(10)
                                    .focused($keyboardFocus)
                                    .frame(height: 160)
                                    .background(Color.white.opacity(0.05).cornerRadius(12))
                            }
                        }
                    }
                    .padding()
                    .background(Color.white
                        .opacity(0.05)
                        .cornerRadius(12))
                    
                    //MARK: type training
                    typeTrainingsListView(vm: vm)
                    
                    //MARK: - Exercise
                    VStack{
                        //MARK: one more task
                        Button(action: {vm.addCelltask()}, label: {
                            HStack{
                                Image(systemName: "plus")
                                Text("Add a exercise")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background {
                                Color.white.opacity(0.1).cornerRadius(12)
                            }
                        })
                        
                        //MARK: - List new task
                        ForEach(vm.simpleExercises.indices, id: \.self) { i in
                            HStack{
                                NewExerciseCellView(text: $vm.simpleExercises[i])
                                    .focused($keyboardFocus)
                                Button {
                                    vm.simpleExercises.remove(at: i)
                                } label: {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .foregroundStyle(.greenApp)
                                        .frame(width: 24, height: 24)
                                }
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
                        if vm.isEditTraining{
                            vm.editTraining()
                        }else{
                            vm.addTraining()
                        }
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
    AddTrainingView(vm: TrainingsViewModel())
}
