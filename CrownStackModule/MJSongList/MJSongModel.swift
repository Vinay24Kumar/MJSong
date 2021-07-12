//
//  MJSongModel.swift
//  CrownStackModule
//
//  Created by 12024-Vinay on 10/07/21.
//  Copyright © 2021 12024-Vinay. All rights reserved.
//

import UIKit

struct MJSongModel : Codable {
    let resultCount: Int?
    let results: [SongData]?
    
}

struct SongData : Codable {
    var wrapperType: String?
    var kind: String?
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var contentAdvisoryRating: String?
    var isStreamable: Bool?
    
    
    
    
}
