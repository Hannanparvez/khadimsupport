//
//  Utils.swift
//  Khadim
//
//  Created by Acxiom Consulting on 26/12/19.
//  Copyright © 2019 Acxiom Consulting. All rights reserved.
//

import Foundation
import UIKit

public class BaseActivity:UIViewController {
    
    public func push(storybId: String, vcId: String, vc: BaseActivity ){
        let storyboard = UIStoryboard(name: storybId, bundle: nil)
        let registrationVC = storyboard.instantiateViewController(withIdentifier: vcId) as! BaseActivity
//        UIApplication.shared.delegate?.window?!.rootViewController = registrationVC
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}

