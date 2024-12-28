//
//  HomeViewController.swift
//  Text Extractor
//
//  Created by Shahzaib Mumtaz on 26/12/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func camera_Button_Pressed(_ sender: UIBarButtonItem) {
        
        // camera button
    }
    
    @IBAction func extract_Text_Button_Pressed(_ sender: UIButton) {
        
        if selectedImage.image != nil && selectedImage.image != UIImage(systemName: "camera.on.rectangle.fill")  {
            let textViewController = storyboard?.instantiateViewController(withIdentifier: "TextViewController") as! TextViewController
            self.navigationController?.pushViewController(textViewController, animated: true)
        } else {
            print("Please select or take image.")
        }
        
    }
    
}
