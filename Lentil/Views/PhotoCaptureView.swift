//
//  PhotoCaptureView.swift
//  Lentil
//
//  Created by Yogesh Sehgal on 10/05/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(image: $image, isShown: $showImagePicker)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
