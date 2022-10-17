//
//  JuegosViewController.swift
//  TapiaColeccionDeJuegos
//
//  Created by Mac 04 on 17/10/22.
//

import UIKit

class JuegosViewController: UIViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
{
    var imagepicker = UIImagePickerController()
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var s: UIImageView!
    @IBAction func fotosTapped(_ sender: Any) {
        imagepicker.sourceType = .photoLibrary
        present(imagepicker, animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func agregarTapped(_ sender: Any) {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = s.image?.jpegData(compressionQuality: 0.50)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate =  self

        // Do any additional setup after loading the view.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagenSeleccionada = info[.originalImage] as? UIImage
        s.image = imagenSeleccionada
        imagepicker.dismiss(animated: true, completion: nil)
    }
}
