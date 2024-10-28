//
//  IntroView.swift
//  FastTrack
//
//  Created by Роман on 12.08.2024.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $pageIndex,
                    content:  {
                ForEach(pages) { page in
                    PageIntroView(page: page)
                        .tag(page.tag)
                        .padding()
                }
            })
            .ignoresSafeArea()
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            
            VStack{
                Text(pages[pageIndex].text)
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .bold))
                HStack{
                    ForEach(0..<pages.count) { page in
                        if pageIndex == page{
                            Circle()
                                .frame(width: 10)
                                .foregroundStyle(.greenApp)
                        }else{
                            Circle()
                                .frame(width: 10)
                                .foregroundStyle(.gray)
                        }

                    }
                }
                //MARK: - Navigation Button
                Button(action: {
                    pageIndex += 1
                    print(pageIndex)
                    if pageIndex > pages.count - 1 {
                        isPresented = true
                        if isFirstLaunch ?? true{
                            isFirstLaunch = false
                        }
                    }
                }, label: {
                    CustomButtonView(text: "Next")
                }).padding()
            }
            .padding()
            .background {
                ZStack {
                    
                    Color.black.ignoresSafeArea()
                        .blur(radius: 10)
                       .shadow(radius: 100)
                    Color.black.ignoresSafeArea()
                }
                    
                    
            }
            
        }
        .fullScreenCover(isPresented: $isPresented, content: {
           HomeView()
        })
        .background {
            Image(.backIntro)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
    
}

#Preview {
    IntroView()
}

