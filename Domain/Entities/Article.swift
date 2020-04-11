struct Article: Codable {
    let status: String
    let feed: Feed
    let items: [Item]
}

struct Feed: Codable {
    let url: String
    let title: String
    let link: String
    let image: String
}

struct Item: Codable {
    let title: String
    let pubDate: String
    let link: String
    let guid: String
    let description: String
}
