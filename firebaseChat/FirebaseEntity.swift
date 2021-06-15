//
//  FirebaseEntity.swift
//  firebaseChat
//
//  Created by 이형상 on 2021/06/14.
//

import Foundation

class FirebaseEntity: NSObject {
    
    var lastest_version_code: String
    var lastest_version_name: String
    var minimum_version_code: String
    var minimum_version_name: String
    var force_update_message: String
    var optional_update_message: String
    
    
    init(lastest_version_code:String, lastest_version_name:String,
         minimum_version_code:String, minimum_version_name:String,
         force_update_message:String, optional_update_message:String) {
        
        self.lastest_version_code       = lastest_version_code
        self.lastest_version_name       = lastest_version_name
        self.minimum_version_code       = minimum_version_code
        self.minimum_version_name       = minimum_version_name
        self.force_update_message       = force_update_message
        self.optional_update_message    = optional_update_message
    }
    
    convenience override init() {
        self.init(lastest_version_code: "", lastest_version_name: "",
                  minimum_version_code: "", minimum_version_name: "",
                  force_update_message: "", optional_update_message: "")
    }
}
