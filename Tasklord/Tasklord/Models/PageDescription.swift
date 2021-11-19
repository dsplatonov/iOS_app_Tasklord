//
//  PageDescription.swift
//  Tasklord
//
//  Created by Дмитрий on 19.11.2021.
//

import Foundation

struct PageDescription: Codable {
    let id, featureimg, published, filename: String
    let descr, img, title, date: String
    let projectid, alias, sort, html: String
}
