//
//  ContentView.swift
//  CrossButtonDesign
//
//  Created by shashank on 15/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var menuOpen: Bool = false
    @State var startAngle: CGFloat = 0.61
    @State var endAngle: CGFloat = 0.62
    @State var showMenu: Bool = false
    @State var showRedPart: Bool = false
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.horizontal, 30)
                Spacer()
                Image(systemName: "house.circle")
                    .padding(.horizontal, 30)
            }
            .overlay(
                Text("Demo")
            )
            .frame(height: 40)
            ScrollView {
                ForEach(0..<5, id: \.self) { index in
                    Image("image\(index+1)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            ZStack(alignment: .bottomTrailing) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100, height:  100, alignment: .center)
                    .overlay(
                        Circle()
                            .trim(from: showMenu ?  0.585: 0.61, to: showMenu ?  0.665: 0.62)
                            .stroke(Color.red, lineWidth: 90)
                            .frame(width: 10, height: 10, alignment: .center)
                            .offset(x: showRedPart ? 0: 30, y: showRedPart ? 0: 30)
                    )
                    .scaleEffect(menuOpen ? 3: 1)
                    .offset(x:50, y: 50)
                    .shadow(radius: 5)
                
               Image(systemName: "externaldrive.connected.to.line.below.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: 20, height: 20)
                .offset(x:showMenu ? -70: 0, y: showMenu ? -70: 0)
                
                Image(systemName: "flame.fill")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .foregroundColor(Color.black)
                    .frame(width: 20, height: 20)
                 .offset(x:showMenu ? -100: 0, y: showMenu ? -20: 0)
                
                Image(systemName: "person.circle.fill")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .foregroundColor(Color.black)
                  .frame(width: 20, height: 20)
                 .offset(x:showMenu ? -20: 0, y: showMenu ? -100: 0)
                
                    
                Circle()
                    .fill(menuOpen ? Color("darkBlue"): Color.white)
                    .overlay(
                        Button(action: {
                            withAnimation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.5)) {
                                
                                if !self.menuOpen {
                                    self.menuOpen.toggle()
                                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5).delay(0.4)) {
                                        self.showRedPart = true
                                    }
                                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.6).delay(1)) {
                                        self.showMenu = true
                                    }
                                } else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5)) {
                                            self.showMenu = false
                                            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1).delay(0.5)) {
                                                self.showRedPart = false
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                                withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5).delay(0.5)) {
                                                    self.menuOpen = false
                                                }
                                            }
                                           
                                        }
                                    }
                                }
                                
                            }
                           
                           
                        }, label: {
                            Image(systemName: self.menuOpen ? "xmark": "line.horizontal.3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(self.menuOpen ? Color.white: Color.black)
                                .font(.title3)
                                .frame(width: 14, height: 14)
                        })
                        .offset(x: -20, y: -20)
                    )
                    .frame(width: 110, height: 110, alignment: .center)
                    .scaleEffect(menuOpen ? 1.3: 1)
                    .offset(x: 50, y: 50)
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: -2, y: -2)
            }
            , alignment: .bottomTrailing
        )
        
        .preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//xmark
//line.horizontal.3
