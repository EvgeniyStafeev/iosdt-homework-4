//
//  AlertExtension.swift
//  Navigation
//
//  Created by Евгений Стафеев on 09.03.2023.
//

import UIKit

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}

class AlertErrorSample {
    
    static let shared = AlertErrorSample()
    
    func alert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let actionOne = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(actionOne)
        UIApplication.topViewController()!.present(alert, animated: true, completion: nil)
    }
}
