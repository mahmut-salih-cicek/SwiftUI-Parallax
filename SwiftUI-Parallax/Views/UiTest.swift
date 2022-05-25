//
//  UiTest.swift
//  SwiftUI-Parallax
//
//  Created by xmod on 15.05.2022.
//

import SwiftUI

struct UiTest: View {
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    
    var body: some View {
        
        ZStack{
            
            Color("ColorBlue").ignoresSafeArea(.all,edges: .all)
            
            VStack{
                
                Capsule()
                    .fill(.white.opacity(0.2))
                
                Circle()
                    .stroke(.white.opacity(0.2),lineWidth: 80)
                
            }
            .frame(width: buttonWidth, height: 80, alignment: .center)
            .padding()
            
            
        }
    };
}

struct UiTest_Previews: PreviewProvider {
    static var previews: some View {
        UiTest()
    }
}
