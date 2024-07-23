//
//  CountryPicker.swift
//  Online-Groceries
//
//  Created by Subham  on 19/06/24.
//

import SwiftUI
import CountryPicker

struct CountryPicker: UIViewControllerRepresentable {
    
    @Binding var country : Country?
    
    class Coordinator : NSObject , CountryPickerDelegate {
        var parent : CountryPicker
        
        init(_ parent: CountryPicker) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "IN"
        countryPicker.delegate = context.coordinator
        
        return countryPicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}


