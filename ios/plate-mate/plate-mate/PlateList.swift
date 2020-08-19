//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateList: View {
    var body: some View {
        List(plateData) { plate in
            PlateRow(plate: plate)
        }
    }
}

struct PlateList_Previews: PreviewProvider {
    static var previews: some View {
        PlateList()
    }
}
