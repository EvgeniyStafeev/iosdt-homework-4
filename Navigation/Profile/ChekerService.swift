//
//  ChekerService.swift
//  Navigation
//
//  Created by Евгений Стафеев on 10.03.2023.
//


import UIKit
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredentials(login: String, password: String)
    func signUp(login: String, password: String)
}

class CheckerService: CheckerServiceProtocol {
    static let shared = CheckerService()
    
    var isSingIn: Bool = false
    
    func checkCredentials(login: String, password: String) {
        Auth.auth().signIn(withEmail: login, password: password) { [self] result, error in
            if let error = error {
                print("error: \(error)")
                let err = error as NSError
                switch err.code {
                //Если ошибка, что пользователь не найден - предлагаем создать
                case AuthErrorCode.userNotFound.rawValue:
                    let alert = UIAlertController(title: "Пользователь не найден", message: "Хотите создать аккаунт?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: {_ in print("Отказ создания аккаунта")}))
                    alert.addAction(UIAlertAction(title: "Да", style: .default, handler: {_ in signUp(login: login, password: password)}))
                    UIApplication.topViewController()!.present(alert, animated: true, completion: nil)
                default:
                    AlertErrorSample.shared.alert(alertTitle: "Ошибка входа", alertMessage: error.localizedDescription)
                }
            } else {
                isSingIn = true
            }
        }
    }
    
    func signUp(login: String, password: String) {
            Auth.auth().createUser(withEmail: login, password: password) { result, error in
                if let error = error {
                    AlertErrorSample.shared.alert(alertTitle: "Ошибка регистрации", alertMessage: error.localizedDescription)
                } else {
                    AlertErrorSample.shared.alert(alertTitle: "Аккаунт создан", alertMessage: "Поздравляем! Ваш аккаунт успешно создан!")
                }
            }
    }
}

