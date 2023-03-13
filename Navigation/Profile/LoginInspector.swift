//
//  LoginInspector.swift
//  Navigation
//
//  Created by Евгений Стафеев on 26.01.2023.
//

import UIKit

class LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        Navigation.CheckerService.shared.checkCredentials(login: login, password: password)
        //Возвращаем принзак проверки для UIViewController (на основании него он решает открывать следующее Вью или нет
        if Navigation.CheckerService.shared.isSingIn == true {
            return true
        } else {
            return false
        }
    }
}
