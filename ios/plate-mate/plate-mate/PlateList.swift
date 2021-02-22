//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI
import Combine

struct PlateList: View {
    @EnvironmentObject var game: Game
    @State var plates: [Plate]
    @Binding var text: String
    @Binding var showSeen: Bool
    @Binding var changed: Int
    
    var body: some View {
        List {
            ForEach(plates.indices.filter({ shouldShowPlate(plate: plates[$0])}), id: \.self) { index in
                PlateRow(plate: self.$plates[index], seen: self.plates[index].seen, changed: self.$changed)
            }
        }
    }
    
    func shouldShowPlate(plate: Plate) -> Bool {
        if changed < 0 {
            return false
        }
        
        let shouldShow = showSeen || !plate.seen
        let shouldFilter = !text.isEmpty && !plate.name!.contains(text)
        
        return shouldShow && !shouldFilter
    }
}

struct PlateList_Previews: PreviewProvider {
    @State static var text = ""
    @State static var showSeen = true
    @State static var changed = 0
    
    static var previews: some View {
        PlateList(plates: [], text: $text, showSeen: $showSeen, changed: $changed)
    }
}
