//
//  ContentView.swift
//  Lentil
//
//  Created by Yogesh Sehgal on 05/05/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int? = nil
    var body: some View {
        ZStack {
            NavigationView{
                ZStack{
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        ZStack{
                            Leaf()
                                .offset(y:-50)
                            
                            VStack {
                                HStack {
                                    ZStack {
                                        NavigationLink(destination: CameraView(), tag: 1, selection: $selection){
                                            Button(action: {
                                                print("Camera")
                                                opt=""
                                                self.selection = 1
                                            }) {
                                                mainButton(icon:"camera.viewfinder")
                                            }
                                        }
                                    }
                                    ZStack {
                                        NavigationLink(destination: SearchView(), tag: 2, selection: $selection){
                                            Button(action: {
                                                print("Search")
                                                self.selection = 2
                                            }) {
                                                mainButton(icon: "doc.text.magnifyingglass")
                                            }
                                        }
                                        .navigationBarHidden(false)
                                    }
                                    
                                }

                                Text("Kitchen for Men, Simplified!")
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Leaf: View {
    var body: some View {
        Path {
            path in
            path.move(to: CGPoint(x:0,y:0))
            path.addLine(to: CGPoint(x:0,y:UIScreen.screenHeight))
            path.addQuadCurve(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight/2), control: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight*0.95))
            path.addLine(to: CGPoint(x:UIScreen.screenWidth,y:UIScreen.screenHeight))
            path.addLine(to: CGPoint(x:UIScreen.screenWidth,y:0))
            //path.addQuadCurve(to: CGPoint(x: 0, y: 300), control: CGPoint(x: 0, y: 100))
            path.addQuadCurve(to: CGPoint(x:0, y: UIScreen.screenHeight/2), control: CGPoint(x:0, y: UIScreen.screenHeight/8))
        }
        .fill(RadialGradient(gradient: Gradient(colors: [.yellow, .red]), center: .center, startRadius: 2, endRadius: 650))
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct mainButton: View {
    let icon: String
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.black)
                .frame(width: 120, height: 120)
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 40))
        }
    }
}
