//
//  PlateRow.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateRow: View {
    var plate: Plate
    @State var seen: Bool
    
    var body: some View {
        HStack {
            VStack {
                plate.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 50)
            Text(plate.name!)
            
            Spacer()
            
            if seen {
                Text("Seen!")
            } else {
                Text("Not seen")
            }
        }
        .padding(10)
        .contentShape(Rectangle())
        .onTapGesture {
            self.plate.seen = !self.plate.seen
            self.seen = self.plate.seen
            do {
                try CoreDataManager.shared.mainContext.save()
            } catch {
                print("Error deleting game")
            }
        }
    }
}

struct PlateRow_Previews: PreviewProvider {
    static var previews: some View {
        let plate = Plate()
        plate.name = "Georgia"
        plate.imageName = "georgia"
        plate.seen = false
        
        return PlateRow(plate: plate, seen: plate.seen)
    }
}
