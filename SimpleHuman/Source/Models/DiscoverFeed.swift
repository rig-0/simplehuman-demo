//
//  DiscoverFeed.swift
//  ©️ 2023 0100
//

import Foundation

struct DiscoverRoot: Codable {
    var data: PageRoot
}

struct PageRoot: Codable {
    var page: Page
}

struct Page: Codable {
    var id: String
    var metafield: Metafield
}

struct Metafield: Codable {
    var value: String
}

struct DiscoverItem: Codable, Equatable {
    struct Blocks: Codable {
        struct BlockVideo: Codable {
            var src: String
        }
        
        struct BlockLabel: Codable {
            var text: String
            var styleType: String
            
            enum CodingKeys : String, CodingKey {
                case text = "text"
                case styleType = "style-type"
            }
        }
        
        var video: [BlockVideo]
        var label: [BlockLabel]
    }
    
    var order: Int
    var name: String
    var blocks: [Blocks]
    
    var videoURL: URL? {
        if let path = self.blocks.first?.video.first?.src {
            let pathWithScheme = "https:" + path
            return URL(string: pathWithScheme)
        }
        
        return nil
    }
    
    static func == (lhs: DiscoverItem, rhs: DiscoverItem) -> Bool {
        return lhs.name == rhs.name
    }
}

class DiscoverFeedParser {
    static func fetch() -> [DiscoverItem] {
        let root = Bundle.main.decode(DiscoverRoot.self, from: "discover.json")
        let value = root.data.page.metafield.value
        guard let data = value.data(using: .utf8) else { return [] }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([DiscoverItem].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
