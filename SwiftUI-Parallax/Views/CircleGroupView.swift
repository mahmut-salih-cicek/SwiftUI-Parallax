//
//  CircleGroupView.swift
//  SwiftUI-Parallax
//
//  Created by xmod on 14.05.2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    // Property
    @State var ShapeColor : Color
    @State var ShapeOpacity : Double
    @State private var isAnimating : Bool = false
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } // : Zstack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5) /// ilk açilişta karakterin ustünde gozukmesin diye bulur ve scale effect verdik
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            /// View görüldüğü an bulari yap
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
