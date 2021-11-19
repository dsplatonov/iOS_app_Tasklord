//
//  TildaAPI.swift
//  Tasklord
//
//  Created by Дмитрий on 19.11.2021.
//

import Foundation
import SwiftyJSON
import Fuzi

class TildaPagesDescriptionAPI {
    
    
    func getPosts(pageId: String, completion: @escaping(String) -> ()) {
        //constructing URL request
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var urlComps = URLComponents()
        
        urlComps.scheme = "https"
        urlComps.host = "api.tildacdn.info"
        urlComps.path = "/v1/getpage/"
        urlComps.queryItems = [
        URLQueryItem(name: "publickey", value: "98f0k85x6wbma1gz5thj"),
        URLQueryItem(name: "secretkey", value: "5753ylc474vl3csgekzw"),
        URLQueryItem(name: "pageid", value: pageId)
        ]
        
        guard let url = urlComps.url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
//            debugPrint(data?.prettyJSON)
            do {
                let descriptionData = try JSON(data)["result"].rawData()
                let description = try JSONDecoder().decode(PageDescription.self, from: descriptionData)
                
                let html = description.html
                let doc = try HTMLDocument(string: html, encoding: String.Encoding.utf8)
                let elementByClass = doc.firstChild(css: ".t-descr")
                if let descriptionText = elementByClass?.stringValue {
                    completion(descriptionText)
                }
                
//                debugPrint(doc.firstChild(css: ".t-descr")?.stringValue)

                
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
