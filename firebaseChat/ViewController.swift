//
//  ViewController.swift
//  firebaseChat
//
//  Created by 이형상 on 2021/06/11.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    private let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref.child("chat").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
                print("value \(value)")
        })
    }
    
    @IBAction func buSendToRooom(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "nextView", bundle: nil)

        guard let viewController = storyboard.instantiateViewController(identifier: "nextViewController") as? nextViewController else {
            return
        }
        viewController.nickName = userName.text!
        viewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true, completion: nil)
    }
}

