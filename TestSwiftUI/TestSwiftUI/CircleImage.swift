//
//  CircleImage.swift
//  TestSwiftUI
//
//  Created by hyeoktae kwon on 2019/06/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("베인")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImagePreviews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
