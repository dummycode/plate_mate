//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateList: View {
    @State var text: String = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $text)
                    .padding(2.5)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
                    .padding(.leading, 10)
                    .padding(.trailing, isEditing ? 0 : 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.default)
    
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        self.hideKeyboard()
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .padding(.leading, 0)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
               }
            }
            
            List(plateData.filter({ text.isEmpty ? true : $0.name.contains(text) })) { plate in
                    PlateRow(plate: plate)
                    .onTapGesture {
                        print("Tapped")
                    }
            }
        }
        .onTapGesture {
            // TODO: clear keyboard, maybe other stuff?
            self.isEditing = false
            self.hideKeyboard()
        }
        // TODO: set actual game title
        .navigationBarTitle("Game Title")
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct PlateList_Previews: PreviewProvider {
    static var previews: some View {
        PlateList()
    }
}
