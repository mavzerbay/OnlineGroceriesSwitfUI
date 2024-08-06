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
    
}
