//
//  CameraView.swift
//  Lentil
//
//  Created by Yogesh Sehgal on 10/05/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import SwiftUI
import CoreML
import Vision
import UIKit

struct CameraView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Spacer()
            Leaf()
            VStack {
                image?.resizable()
                    .frame(width: 120.0, height: 120.0, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black,lineWidth: 2))
                    .onAppear(perform: lentilDetection)
                Text(opt)
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                Button(action:{
                    print("Camera")
                    self.showImagePicker = true
                }) {
                    mainButton(icon:"camera.viewfinder")
                }
            }.sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
        }
    }
    
    
}

func lentilDetection(){
    print("Photograph Clicked")
    print(opt)
}



struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

