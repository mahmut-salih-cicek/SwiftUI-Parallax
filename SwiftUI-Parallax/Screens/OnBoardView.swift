//
//  OnBoardView.swift
//  SwiftUI-Parallax
//
//  Created by xmod on 14.05.2022.
//

import SwiftUI

struct OnBoardView: View {
    
    // MARK: - Property
    @AppStorage("onBoard") var isOnboardingViewActive : Bool = true
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    @State private var isAnimating : Bool = false
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all,edges: .all)
            VStack(spacing:20) {
                // MARK: - HEADER Text
                Spacer()
                VStack(spacing:0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
It's not how much we give but
how mcuh love we put into giving.
""")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                }// : Header Text
                .opacity(isAnimating ? 1 : 0)
                .offset(y:isAnimating ? 0 : -100)
                .animation(.easeOut(duration: 1), value: isAnimating)
                // MARK: - CENTER Image
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x:isAnimating ? 0 : 100)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                }
                Spacer()
                // MARK: - Footer Slider Button
                ZStack{
                    // PArts of the Custom Button
                    // 1. background (static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2 call to action (static)
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    // 3 capsule (dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    // 4 circle (draggable)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding()
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x:buttonOffset)
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0 && buttonOffset<=buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            })
                            .onEnded{ _ in
                                withAnimation(Animation.easeOut(duration: 0.4)){
                                    if buttonOffset > buttonWidth / 2 {
                                    buttonWidth = buttonWidth - 80
                                    isOnboardingViewActive = false // ekranda yariyi gectiginde ekran gecisi saglancak
                                    }else{
                                    buttonOffset = 0
                                    }
                                }
                            }
                        )// : Gesture
                        
                        
                        Spacer()
                    }// : Hstack
                }//: Footer
                .frame( width:buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y:isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1),value: isAnimating)
            }// MARK: - Vstack
        }// MARK: - Zstack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnBoardView_Previews: PreviewProvider {
    // MARK: - PREVIEW
    static var previews: some View {
        OnBoardView()
    }
}
