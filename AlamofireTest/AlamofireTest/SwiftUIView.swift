//
//  SwiftUIView.swift
//  AlamofireTest
//
//  Created by hyeoktae kwon on 2019/06/07.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import SwiftUI
import Alamofire

@available(iOS 13.0, *)
struct SwiftUIView : View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    } {
    Text("button")
    }
}



func networking(_ sender: UIButton) {
    
}

#if DEBUG
@available(iOS 13.0, *)
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
#endif
