//
//  TildaAPI.swift
//  Tasklord
//
//  Created by Дмитрий on 17.11.2021.
//

import Foundation
import SwiftyJSON

class TildaPagesListAPI {
    
    
    func getPosts(completion: @escaping([Page]) -> ()) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var urlComps = URLComponents()
        
        urlComps.scheme = "https"
        urlComps.host = "api.tildacdn.info"
        urlComps.path = "/v1/getpageslist/"
        urlComps.queryItems = [
        URLQueryItem(name: "publickey", value: "98f0k85x6wbma1gz5thj"),
        URLQueryItem(name: "secretkey", value: "5753ylc474vl3csgekzw"),
        URLQueryItem(name: "projectid", value: "4157333")
        ]
        
        guard let url = urlComps.url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
//            debugPrint(data?.prettyJSON)
            do {
                let pagesData = try JSON(data)["result"].rawData()
                let pages = try JSONDecoder().decode([Page].self, from: pagesData)
                completion(pages)
            } catch {
                debugPrint(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
    }
    
    
}
