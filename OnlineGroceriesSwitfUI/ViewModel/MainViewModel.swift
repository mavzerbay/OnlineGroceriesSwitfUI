//
//  MainViewModel.swift
//  OnlineGroceriesSwitfUI
//
//  Created by Erbay MAVZER on 5.08.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()

    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    //MARK: ServiceCall

    func login() {
        if(!txtEmail.isValidEmail){
            self.errorMessage = "Please enter a valid email address"
            self.showError = true
            return
        }
        if(txtPassword.isEmpty){
            self.errorMessage = "Please enter a valid password"
            self.showError = true
            return
        }
        
        let parameter = ["email": txtEmail, "password": txtPassword]
        ServiceCall.post(parameter: parameter as NSDictionary, path: Globs.SV_LOGIN, withSuccess: { (responseObj) in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        }) { (error) in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }

}
