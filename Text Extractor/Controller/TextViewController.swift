//
//  TextViewController.swift
//  Text Extractor
//
//  Created by Shahzaib Mumtaz on 26/12/2024.
//

import UIKit
import Vision

class TextViewController: UIViewController {

    @IBOutlet weak var extractedText: UITextView!
    
    var imageSelected: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageSelected != nil {
            print("Image is selected")
        } else {
            print("image is not selected")
        }
    }
    
    func readTextFromImage(img: UIImage) {
        
        guard let cgImage = imageSelected?.cgImage else {return}
        
        // creating request with cgImage
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        // Vision provides its text-recognition capabilities through VNRecognizeTextRequest, an image-based request type that finds and extracts text in images.
        let request = VNRecognizeTextRequest { request, error in
            
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else { return
            }
             let text = observations.compactMap({
             $0.topCandidates(1).first?.string
             }).joined(separator: ", ")
             print(text) // text we get from image
            self.extractedText.text = text
        }
        
//        request.recognitionLevel = VNRequestTextRecognitionLevel
//        try handler.perform([request])
        
        //Just add .fast at the end
        request.recognitionLevel = VNRequestTextRecognitionLevel.fast
        
        //Just add .fast at the end
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
        
        // just add the Language code
        request.recognitionLanguages = ["Language code you need"]
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
       // try handler.perform([request])
    }
    
}
