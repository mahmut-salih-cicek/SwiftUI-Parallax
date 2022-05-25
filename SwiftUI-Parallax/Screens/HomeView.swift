//
//  HomeView.swift
//  SwiftUI-Parallax
//
//  Created by xmod on 14.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onBoard") var isOnBoaringViewActive : Bool = false
    @State private var isAnimating : Bool = false
    
    var body: some View {
   
        VStack(spacing:20){
        
      // MARK: Header
        Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y:isAnimating ? 35 : -35)
                .animation(Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                            ,value: isAnimating
                )
            }
            
      // MARK: Center
        Text("The Time that leads to mastery is dependent on the instensity our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                .offset(y:isAnimating ? 0 : 20)
                .animation(Animation
                            .easeOut(duration: 2)
                            .repeatForever()
                           ,value: isAnimating
                )
      // MARK: Footer
        Spacer()
            Button {
                withAnimation{
                    isOnBoaringViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
            }// Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }// : vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { /// async fonk ile sayfa acildiktan sonra karakteri 0.5 saniye sonra hareketlendircez
                isAnimating = true
            })
        })
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
