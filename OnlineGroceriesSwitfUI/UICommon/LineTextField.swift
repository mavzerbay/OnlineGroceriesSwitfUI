//
//  LineTextField.swift
//  OnlineGroceriesSwitfUI
//
//  Created by Erbay MAVZER on 5.08.2024.
//

import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            TextField(placeholder, text: $txt)
                .keyboardType(keyboardType)
                .disableAutocorrection(true)
                .frame(height: 40)



            Divider()
        }
    }
}


struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"

    @Binding var txt: String
    @Binding var isShowPassword: Bool

    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            if isShowPassword {
                TextField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)

            }
            else {
                SecureField(placeholder, text: $txt)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)

            }


            Divider()
        }
    }
}

#Preview {
    LineTextField(txt: .constant(""))
        .padding(20)
}
