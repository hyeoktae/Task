//
//  Post.swift
//  TestVision
//
//  Created by hyeoktae kwon on 13/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//


import Foundation
import UIKit
//import Alamofire


func request(_ image: UIImage) {
    
    let imagePNG = image.pngData()!
    
    let param: Parameters = [
        "file": MultipartFormData.init(fileManager: .default, boundary: nil)
            .append(imagePNG, withName: "file")
    ]
    
    MultipartFormData.init(fileManager: .default, boundary: nil)
        .append(imagePNG, withName: "file")
    
    let headers: HTTPHeaders = [
        "Authorization": "KakaoAK 83b8387c1804d74abf5ccf2bd6c6dfa0"
    ]
    
    let request = AF.request("https://kapi.kakao.com/v1/vision/face/detect", method: .post, parameters: param, headers: headers, interceptor: nil).convertible
    
    let imageRequest = AF.upload(multipartFormData: MultipartFormData(fileManager: .default, boundary: nil), with: request).validate()
    
    imageRequest.responseJSON { (response) in
        switch response.result {
        case .success:
            print("Validation Successful")
        case .failure(let error):
            print("error", error.localizedDescription)
        }
        do{
            let value = try JSONDecoder().decode(Effect.self, from: response.data!)
            print("success", value)
        } catch {
            let value = try! JSONDecoder().decode(ErrorCode.self, from: response.data!)
            print("fail", value)
        }
    }
    
    
    
}

func uploadImage(_ image: UIImage) {
    let headers = [
        "Authorization": "KakaoAK 83b8387c1804d74abf5ccf2bd6c6dfa0",
        "User-Agent": "PostmanRuntime/7.11.0",
        "Accept": "*/*",
        "Cache-Control": "no-cache",
        "Postman-Token": "54f3a943-2e10-435d-8e9b-b64175492294,de4ad72c-f25e-45b0-945a-2dbc72294a8e",
        "Host": "kapi.kakao.com",
        "accept-encoding": "gzip, deflate",
        "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
        "content-length": "7555344",
        "Connection": "keep-alive",
        "cache-control": "no-cache"
    ]
    
    
    let appSupportDir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
    let imageUrl = appSupportDir.appendingPathComponent("image.png")
    let imageData = image.jpegData(compressionQuality: 0.1)!
    do {
        try imageData.write(to: imageUrl)
    } catch {
        print("Error :", error.localizedDescription)
    }
    
    
    
    let parameters = [
        [
            "name": "file",
            "fileName": imageUrl.absoluteString,
            "content-type": "multipart/form-data"
        ]
    ]
    
    let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
    
    var body = ""
    for param in parameters {
        let paramName = param["name"]!
        body += "--\(boundary)\r\n"
        body += "Content-Disposition:form-data; name=\"\(paramName)\""
        if let filename = param["fileName"] {
            let contentType = param["content-type"]!
            var fileContent: String = ""
            do{
                fileContent = try String(contentsOfFile: filename, encoding: .utf8)
            } catch{
                print("filecontent :", error.localizedDescription)
            }
            body += "; filename=\"\(filename)\"\r\n"
            body += "Content-Type: \(contentType)\r\n\r\n"
            body += fileContent
            body += "--\(boundary)--"
        } else if let paramValue = param["value"] {
            body += "\r\n\r\n\(paramValue)"
        }
    }
    
    
    var request = URLRequest(url: URL(string: "https://kapi.kakao.com/v1/vision/face/detect")!,
                             cachePolicy: .useProtocolCachePolicy,
                             timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = body.data(using: .utf8)
    // body.data(using: .utf8)
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error?.localizedDescription)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            do {
                let result = try JSONDecoder().decode(Effect.self
                    , from: data!)
                print(result)
            } catch {
                let result = try! JSONDecoder().decode(ErrorCode.self, from: data!)
                print(result)
            }
        }
    })
    dataTask.resume()
}
