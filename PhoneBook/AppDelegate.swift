//
//  AppDelegate.swift
//  PhoneBook
//
//  Created by 304 on 2020/09/08.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    //앱이 실행될 때 호출되는 메소드
    //launchOptions 에 앱이 실행된 방법을 저장
    //앱은 직접 실행할 수 도 있지만 URL을 이용해서 실행할 수 도 있습니다.
    //URL을 이용해서 실행하는 방법이 웹에서 페이스 북을 볼려고 할 때 앱으로 실행하시겠습니까 물어보고 실행하는 것이나 카카오톡에서 다른 게임이나 앱을 실행할 때 사용합니다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //파일 경로를 생성 - Document 디렉토리의 phonebook.sqlite
        let fileMgr = FileManager.default
        
        //도큐먼트 디렉토리 경로 만들기
        let docPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docDir = docPaths[0] as String
        
        //파일 경로 생성
        let dbPath = docDir.appending("/phonebook.sqlite")
        
        //파일의 존재 여부 확인
        if fileMgr.fileExists(atPath: dbPath){
            NSLog("파일이 존재함")
        }else{
            //데이터베이스 생성
            let contactDB = FMDatabase(path: dbPath)
            //데이터베이스 열기
            if contactDB.open(){
                let sql =
                """
                    create table if not exists phonebook(num INTEGER not null primary key autoincrement,
                        name TEXT, phone TEXT, addr TEXT)
                """
                if contactDB.executeStatements(sql){
                    NSLog("테이블 생성 sucess")
                }else{
                    NSLog("테이블 생성 실패")
                }
            }else{
                NSLog("데이터 베이스 열기 실패")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

