//
//  nextViewController.swift
//  firebaseChat
//
//  Created by 이형상 on 2021/06/14.
//

import UIKit
import Firebase
import FirebaseDatabase

class nextViewController: UIViewController {
    private let ref = Database.database().reference()
    var nickName: String = ""

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("nickName:=============\(self.nickName)")
        
        ref.child("chat").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
                print("value \(value)")
        })
    }
    
    @IBAction func addChat(_ sender: Any) {
        
        let alert = UIAlertController(title: "채팅방 이름 입력", message: "", preferredStyle:  .alert)
        
        alert.addTextField { field in
            field.placeholder = "채팅방 이름을 입력해주세요."
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    DispatchQueue.main.async {

                        let chat = Database.database().reference(withPath: "chat")
                        let chatItem = chat.child("\(text)")
                        let values: [String: Any] = ["userName": self?.nickName ?? "",
                                                     "chatName": text]
                        
                        self?.ref.child("chat").setValue(values)
                    }
                }
            }
        }))

        present(alert, animated: true)
        
    }
}

//extension nextViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var cell: Int? = nil
//        let chat = Firestore.firestore().collection("Chats").whereField("users", arrayContains: Auth.auth().currentUser?.uid ?? "Not Found User 1")
//        cell =
//        self.ref.child("users/\(user.uid)/username").getData { (error, snapshot) in
//            if let error = error {
//                print("Error getting data \(error)")
//            }
//            else if snapshot.exists() {
//                print("Got data \(snapshot.value!)")
//            }
//            else {
//                print("No data available")
//            }
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//}
