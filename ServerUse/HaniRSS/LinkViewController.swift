import UIKit
import WebKit
class LinkViewController: UIViewController {

    //상위 뷰 컨트롤러부터 넘겨주는 데이터를 저장할 변수
    var link : String!
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //문자열 주소 -> URL -> URLRequest
        let url = URL(string: link)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
