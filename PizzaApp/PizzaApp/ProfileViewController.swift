//
//  ViewController.swift
//  PizzaApp
//
//  Created by Дмитрий Петров on 29.01.2023.
//

import UIKit


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var userAvatarOutlet: UIImageView!
    @IBOutlet var uINameField: UITextField!
    @IBOutlet var uIPhoneNumberField: UITextField!
    @IBOutlet var uICityField: UITextField!
    @IBOutlet var uIStreetField: UITextField!
    let imagePicker = UIImagePickerController()
    @IBAction func saveChangesButton(_ sender: UIButton) {
        Storage.main.image = userAvatarOutlet.image
        Storage.main.streetFieldString = uIStreetField.text ?? ""
        Storage.main.nameFieldString = uINameField.text ?? ""
        Storage.main.phoneNumberFieldString = uIPhoneNumberField.text ?? ""
        Storage.main.cityFieldString = uICityField.text ?? ""
        
    }
    @IBAction func userAvatarChange(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func loadData() {
        userAvatarOutlet.image = Storage.main.image
        uIStreetField.text = Storage.main.streetFieldString
        uINameField.text = Storage.main.nameFieldString
        uIPhoneNumberField.text = Storage.main.phoneNumberFieldString
        uICityField.text = Storage.main.cityFieldString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
        imagePicker.delegate = self
    }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                userAvatarOutlet.contentMode = .scaleAspectFit
                userAvatarOutlet.layer.borderWidth = 2
                userAvatarOutlet.layer.borderColor = UIColor.lightGray.cgColor
                userAvatarOutlet.layer.cornerRadius = 50
                userAvatarOutlet.clipsToBounds = true
                userAvatarOutlet.image = pickedImage

            }

            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        
    }
}
