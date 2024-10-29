//
//  PlayerInfoView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct PlayerInfoView: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        VStack {
            //MARK: - Image
            HStack(alignment: .top) {
                Spacer()
                if let dataImage = vm.user?.photo{
                    if let image = Image(data: dataImage) {
                        image
                            .resizable()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .offset(x: 25)
                    }
                }else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .cornerRadius(100)
                        .padding()
                        .offset(x: 25)
                }
                
                
                Spacer()
                
                //MARK: Edite button
                NavigationLink {
                    AddInfoUserView(vm: vm)
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.5))
                }
                
                
            }
            
            //MARK: - Name
            Text(vm.user?.name ?? "User name")
            
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
            
            //MARK: - Position
            Text(vm.user?.position ?? "Position")
                .foregroundStyle(.gray)
            
            HStack {
                //MARK: - Age
                VStack{
                    HStack{
                        Text("Age")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                        
                        Spacer()
                        
                        Image(systemName: "sun.min.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    }
                    Text("\(vm.user?.age ?? 0)")
                        .foregroundStyle(.greenApp)
                        .font(.system(size: 28))
                    
                    
                }
                .padding()
                .background(Color.white.opacity(0.05).cornerRadius(32))
                
                //MARK: - Experience
                VStack{
                    HStack{
                        Text("Experience")
                            .foregroundStyle(.white)
                            .font(.system(size: 13))
                        
                        Spacer()
                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    }
                    Text("\(vm.user?.experience ?? 0)")
                        .foregroundStyle(.greenApp)
                        .font(.system(size: 28))
                    
                    
                }
                .padding()
                .background(Color.white.opacity(0.05).cornerRadius(32))
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.05).cornerRadius(32))
    }
}

#Preview {
    ZStack {
        Color.main
        PlayerInfoView(vm: HomeViewModel())
    }
}
