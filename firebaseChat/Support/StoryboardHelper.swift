//
//  StoryboardHelper.swift
//  firebaseChat
//
//  Created by 이형상 on 2021/06/15.
//

import UIKit

protocol StoryboardHelper {}

extension StoryboardHelper where Self: UIViewController {
    static func instantiate(storyboard: String) -> Self {
        let uiStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        
        let identifier = String(describing: self)
        let utf8String = String(utf8String: identifier)
       
        return uiStoryboard.instantiateViewController(withIdentifier: utf8String!) as! Self
    }
}

extension UIViewController: StoryboardHelper {}
