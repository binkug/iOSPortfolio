import UIKit

class SyncDownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트를 다운로드 받아서 TextView에 출력
        let tv = UITextView(frame:CGRect(x:0, y:20, width:320, height:300))
        //동기적 다운로드
        let naverUrl = "https://www.naver.com"
        let url = URL(string:naverUrl)
        //예외처리를 강제하는 코드에서 try! 를 붙이면 예외처리를 하지 않아도 됩니다.
        let naverData = try! Data(contentsOf:url!)
        //문자열로 변환해서 tv에 출력
        let naverString = String(data:naverData, encoding:.utf8)
        tv.text = naverString
        
        //텍스트 뷰를 현재 뷰 컨트롤러의 뷰에 추가
        self.view.addSubview(tv)
        
        let imageView = UIImageView(frame:CGRect(x:0, y:0, width:320, height:280))
        
        let imgAddr = "http://img.hani.co.kr/imgdb/resize/2018/0518/00502318_20180518.JPG"
        let imgUrl = URL(string:imgAddr)
        let imgData = try! Data(contentsOf:imgUrl!)
        
        let image = UIImage(data : imgData)
        imageView.image = image
        
        self.view.addSubview(imageView)
    }
}
