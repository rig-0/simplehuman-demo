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
    
    var productTextBlock: BlockLabel? {
        return self.blocks.first?.label.first(where: { $0.styleType == "normal" })
    }
    
    var ctaTextBlock: BlockLabel? {
        return self.blocks.first?.label.first(where: { $0.styleType == "cta" })
    }
    
    static func == (lhs: DiscoverItem, rhs: DiscoverItem) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Blocks: Codable {
    var video: [BlockVideo]
    var label: [BlockLabel]
}

struct BlockVideo: Codable {
    var src: String
}

struct BlockLabel: Codable {
    var text: String
    var styleType: String
    var style: BlockStyle
    
    enum CodingKeys : String, CodingKey {
        case text = "text"
        case styleType = "style-type"
        case style = "style"
    }
}

struct BlockStyle: Codable {
    var textColor: String
    var fontSize: CGFloat
    var borderColor: String?
    
    enum CodingKeys : String, CodingKey {
        case textColor = "text-color"
        case fontSize = "font-size"
        case borderColor = "border-color"
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
