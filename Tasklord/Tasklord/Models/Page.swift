//
//  Post.swift
//  Tasklord
//
//  Created by Дмитрий on 17.11.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let page = try? newJSONDecoder().decode(Page.self, from: jsonData)

import Foundation

// MARK: - Result
struct Page: Codable {
    let img, alias, id, sort: String
    let title, descr, date, projectid: String
    let published, filename, featureimg: String
}
