//
//  HomeViewController.swift
//  Text Extractor
//
//  Created by Shahzaib Mumtaz on 26/12/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlets.
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    var selectImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions.
    
    @IBAction func camera_Button_Pressed(_ sender: UIBarButtonItem) {
        
        showImageSelectionOptions()
        
    }
    
    @IBAction func extract_Text_Button_Pressed(_ sender: UIButton) {
        
        if selectedImage.image != nil && selectedImage.image != UIImage(systemName: "camera.on.rectangle.fill")  {
            let textViewController = storyboard?.instantiateViewController(withIdentifier: "TextViewController") as! TextViewController
            textViewController.imageSelected = selectImage
            self.navigationController?.pushViewController(textViewController, animated: true)
        } else {
            print("Please select or take image.")
        }
        
    }
    
}

extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImageSelectionOptions () {
        
        let actionSheet = UIAlertController(title: "Choose option to capture or select photo", message: "", preferredStyle: .actionSheet)
        
        // MARK:- Camera
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.camera
            image.allowsEditing = false
            self.present(image, animated: true)
        }))
        
        // MARK:- Photo Library
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
            self.present(image, animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil ))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage.image = image
            selectImage = image
        } else {
            print("Error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
