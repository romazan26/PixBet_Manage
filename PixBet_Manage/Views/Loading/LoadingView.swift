//
//  ContentView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var timeLoading: Int = 0
    @State private var isPresent: Bool = false
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            Image(.logo)
                .resizable()
                .frame(width: 200, height: 200)
            ProgressView()
                .padding(.top, 350)
                .colorScheme(.dark)
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            if isFirstLaunch ?? true {
                IntroView()
            }else{
                HomeView()
            }
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if timeLoading < 100{
                    timeLoading += 1
                }else {
                    timer.invalidate()
                    isPresent = true
                }
            }
        })

    }
}

#Preview {
    LoadingView()
}
