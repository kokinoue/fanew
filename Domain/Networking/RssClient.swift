import Foundation

enum NetworkError: Error {
  case invalidURL
  case unknown
  case invalidResponse
}

class RssClient {
//  staticはRubyでいうクラスメソッド
// - Parameter urlString: 取得元RSSのurl
// - Parameter completion: 完了時の処理
    static func fetchItems(urlString: String, completion: @escaping (Result<[Item], Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.unknown))
                return
            }
            
            let decoder = JSONDecoder()
            guard let article = try?decoder.decode(Article.self, from: data) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(article.items))
        })
        task.resume()
    }
}
