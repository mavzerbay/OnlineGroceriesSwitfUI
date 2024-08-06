//
//  CountryPickerUI.swift
//  OnlineGroceriesSwitfUI
//
//  Created by Erbay MAVZER on 5.08.2024.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {
    
    @Binding var country: Country?
    
    class Coordinator:NSObject, CountryPickerDelegate {
        var parent: CountryPickerUI
        
        init(_ parent:CountryPickerUI) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
            
        }
    }
   
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let picker = CountryPickerViewController()
        picker.selectedCountry = "TR"
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
