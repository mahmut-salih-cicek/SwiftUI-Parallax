//
//  ContentView.swift
//  SwiftUI-Parallax
//
//  Created by xmod on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onBoard") var isOnBoardingViewActive : Bool = true
    
    var body: some View {
        ZStack{
            if isOnBoardingViewActive{
                OnBoardView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
