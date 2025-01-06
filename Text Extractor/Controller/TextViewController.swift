//
//  TextViewController.swift
//  Text Extractor
//
//  Created by Shahzaib Mumtaz on 26/12/2024.
//

import UIKit
import Vision

class TextViewController: UIViewController {

    // MARK: - @IBOutlets.
    
    @IBOutlet weak var extractedText: UITextView!
    
    var imageSelected: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageSelected != nil {
            readTextFromImage(img: imageSelected!)
        } else {
            print("image is not selected")
        }
    }
    
    private func readTextFromImage(img: UIImage) {
        
        guard let cgImage = imageSelected?.cgImage else {
            fatalError("Could not get CGImage")
        }
        
        // creating request with cgImage
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        let request = VNRecognizeTextRequest  { request, error in
            
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else { return
            }
             let text = observations.compactMap({
             $0.topCandidates(1).first?.string
             }).joined(separator: ", ")
             print(text) // text we get from image
           
            DispatchQueue.main.async {
                self.extractedText.text = text
            }
        }
        
        // Process Request
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
