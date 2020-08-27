import UIKit

class RootViewController: UITableViewController {

    //테이블에 출력할 데이터 배열
    var titles = Array<String>()
    var contents = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "iOS 실습 내용"
        
        titles.append("사용자 정의 셀")
        contents.append("셀을 원하는 모양으로 만들어서 출력")
        
        titles.append("테이블 뷰 편집")
        contents.append("데이터를 삽입하고 삭제 그리고 이동")
        
        titles.append("그룹 별 분류")
        contents.append("한글 자음 별 분류 및 검색 과 인덱싱")
        
        titles.append("하위 데이터 출력")
        contents.append("테이블 뷰의 업데이트도 수행")
        
        titles.append("컬렉션 뷰 사용")
        contents.append("컬렉션 뷰의 출력 과 선택 이벤트")
        
        titles.append("소켓 프로그래밍")
        contents.append("TCP 소켓 프로그래밍")
        
        titles.append("동기적 다운로드")
        contents.append("텍스트와 이미지를 동기적으로 다운로드 받아서 출력")
        
    }

    //섹션의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 구분자를 생성
        let cellIdentifier = "cell"
        //테이블 뷰에서 재사용 가능한 셀을 받아옵니다.
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        //재사용 가능 셀이 없으면 생성
        //style을 subtitle로 설정하면 레이블 2개, 이미지 뷰 1개
        //엑세서리 뷰 1개 모두 사용 가능
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        //레이블에 텍스트를 출력
        cell!.textLabel!.text = titles[indexPath.row]
        cell!.detailTextLabel!.text = contents[indexPath.row]
        //엑세서리 모양을 설정
        cell!.accessoryType = .disclosureIndicator

        return cell!
    }
    

    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath.row == 0{
            let customCellViewController = self.storyboard?.instantiateViewController(withIdentifier: "CustomCellViewController") as! CustomCellViewController
            self.navigationController?.pushViewController(customCellViewController, animated: true)
        }else if indexPath.row == 1{
            let editTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditTableViewController") as! EditTableViewController
            self.navigationController?.pushViewController(editTableViewController, animated: true)
        }else if indexPath.row == 2{
            let classificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ClassificationViewController") as! ClassificationViewController
            self.navigationController?.pushViewController(classificationViewController, animated: true)
        }else if indexPath.row == 3{
            let attractionMainViewController = self.storyboard?.instantiateViewController(withIdentifier: "AttractionMainViewController") as! AttractionMainViewController
            self.navigationController?.pushViewController(attractionMainViewController, animated: true)
        }else if indexPath.row == 4{
            let carCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CarCollectionViewController") as! CarCollectionViewController
            self.navigationController?.pushViewController(carCollectionViewController, animated: true)
        }else if indexPath.row == 5{
            let socketClientViewController = self.storyboard?.instantiateViewController(withIdentifier: "SocketClientViewController") as! SocketClientViewController
            self.navigationController?.pushViewController(socketClientViewController, animated: true)
        }
        else if indexPath.row == 6{
            let syncDownloadViewController = self.storyboard?.instantiateViewController(withIdentifier: "SyncDownloadViewController") as! SyncDownloadViewController
            self.navigationController?.pushViewController(syncDownloadViewController, animated: true)
        }

    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
