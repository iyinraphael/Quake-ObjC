//
//  ViewController.swift
//  ImagePicker
//
//  Created by Iyin Raphael on 8/8/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func choosePhoto(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (permission) in
            if permission == .authorized {
                print("User granted us access")
                
                DispatchQueue.main.sync {
                   self.presentImgaeController()
                }
            }
        }
    }
    
    func presentImgaeController(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

