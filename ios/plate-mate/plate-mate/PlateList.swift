//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateList: View {
    var title: String
    @State var plates: [Plate]
    @State var text: String = ""
    @State private var isEditing = false
    @State var showSeen = false
    
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
            
            HStack {
                Toggle(isOn: $showSeen, label: {
                    Text("Show Seen")
                })
                    .padding(.horizontal, 10)
            }
            
            List(plates.filter { shouldShowPlate(plate: $0) }) { plate in
                PlateRow(plate: plate, seen: plate.seen)
            }
        }
        .onTapGesture {
            // TODO: clear keyboard, maybe other stuff?
            self.isEditing = false
            self.hideKeyboard()
        }
        .navigationBarTitle(title)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func shouldShowPlate(plate: Plate) -> Bool {
        let shouldShow = showSeen || !plate.seen
        let shouldFilter = !text.isEmpty && !plate.name!.contains(text)
        
        return shouldShow && !shouldFilter
    }
}

struct PlateList_Previews: PreviewProvider {
    static var previews: some View {
        PlateList(title: "Road Trip", plates: plateData)
    }
}
