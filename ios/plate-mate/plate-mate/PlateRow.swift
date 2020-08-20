//
//  PlateRow.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateRow: View {
    var plate: MyPlate
    
    var body: some View {
        HStack {
            VStack {
                plate.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 50)
            Text(plate.name)
            Spacer()
            if plate.seen {
                Text("Seen!")
            } else {
                Text("Not seen")
            }
        }
        .contentShape(Rectangle())
        .padding(10)
    }
}

struct PlateRow_Previews: PreviewProvider {
    static var previews: some View {
        PlateRow(plate: MyPlate(name: "Georgia", asset: "georgia"))
    }
}
