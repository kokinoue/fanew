import UIKit
import SafariServices

class ArticleViewController: UIViewController {
    
    var tableView = UITableView()
    
    var wwdURL: String = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.wwdjapan.com%2Ffeed"
    var fashionsnapURL: String = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.fashionsnap.com%2Frss.xml"
    var senkenURL: String = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fsenken.co.jp%2Fposts%2Ffeed.xml"
    
    // 記事一覧
    private var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        RssClient.fetchItems(urlString: wwdURL, completion: { (response) in
            switch response {
            case .success(let items):
                DispatchQueue.main.async() { [weak self] in
                    guard let me = self else { return }
                    me.items = items
                }
            case .failure(let err):
                print("記事の取得に失敗しました。\(err)")
            }
        })
    }
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.items.count)
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = items[indexPath.row].link
        let viewController = SFSafariViewController(url: URL(string: url)!)
        present(viewController, animated: true, completion: nil)
    }
}
