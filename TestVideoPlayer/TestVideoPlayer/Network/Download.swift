//
//  Download.swift
//  TestVideoPlayer
//
//  Created by hyeoktae kwon on 2019/07/04.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation



class Download {
  static let shared = Download()
  
  let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/test-64199.appspot.com/o/hack_Final.mp4?alt=media&token=f7fc95a4-c470-443b-a17f-f6a87a03205a")!
  
  func downloadTask(completion: @escaping (Result<Data, Fail>) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, err) in
      
      guard err == nil, let res = response as? HTTPURLResponse, 200 <= res.statusCode, res.statusCode < 300 else { return completion(.failure(.NetworkErr)) }
      
      guard let data = data else { return completion(.failure(.NoData)) }
      
      completion(.success(data))
      
    }.resume()
  }
}
