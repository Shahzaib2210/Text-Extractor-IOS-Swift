//
//  TextViewController.swift
//  Text Extractor
//
//  Created by Shahzaib Mumtaz on 26/12/2024.
//

import UIKit

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
    
}
