//
//  KeyboardObserver.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

final class KeyboardObserver { 
    static func willShow(completion: @escaping(CGFloat) ->() ){
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (note) in
            guard let frame = (note.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return}
            guard let duration = (note.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return}
            let curve = UIView.AnimationOptions(rawValue: (note.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue ?? 0)
            UIView.animate(withDuration: duration, delay: 0, options: curve, animations: {
                completion(frame.height)
                
            }, completion: nil)
        }
    }
    
    static func willHide(completion: @escaping(CGFloat) ->() ){
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (note) in
            guard let frame = (note.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return}
            guard let duration = (note.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return}
            let curve = UIView.AnimationOptions(rawValue: (note.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue ?? 0)
            UIView.animate(withDuration: duration, delay: 0, options: curve, animations: {
                completion(frame.height)
                
            }, completion: nil)
        }
    }
}
