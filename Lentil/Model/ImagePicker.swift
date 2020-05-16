//
//  ImagePicker.swift
//  Lentil
//
//  Created by Yogesh Sehgal on 10/05/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import CoreML
import Vision

var opt = ""

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var isShown: Bool
    @Binding var image: Image?

    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
        
        guard let ciimage = CIImage(image: uiImage) else {
            fatalError("Could Not Convert to CIImage")
        }
        
        detect(image: ciimage)
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var isShown: Bool
    @Binding var image: Image?

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }

   func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera
        }
        return picker
    }

}



func detect(image:CIImage){
    guard let model = try?VNCoreMLModel(for: Lentil().model) else{
        fatalError("Loading CoreML Failed")
    }
    
    let request = VNCoreMLRequest(model: model){ (request,error) in
        guard let results = request.results?.first as? VNClassificationObservation else{
            fatalError("Could Not Classify")
        }
        
        opt=results.identifier
        print(opt)
        
    }
    
    
    let handler=VNImageRequestHandler(ciImage: image)
    
    do{
    try handler.perform([request])
    }
    catch{
        print(error)
    }
}



struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
