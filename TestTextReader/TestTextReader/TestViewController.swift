////
////  TestViewController.swift
////  TestTextReader
////
////  Created by hyeoktae kwon on 16/05/2019.
////  Copyright © 2019 hyeoktae kwon. All rights reserved.
////
//import UIKit
//
//import AVFoundation
//
//class TestViewController: UIViewController,AVAudioPlayerDelegate, AVAudioRecorderDelegate{
//
//
//
//
//
//    //변수 및 상수
//
//    var audioPlayer : AVAudioPlayer!    //avaudioplayer인스턴스 변수
//
//    var audioFile : URL!                // 재생할 오디오의 파일명 변수
//
//    let MAX_VOLUME : Float = 10.0       //최대 불륨, 실수형 상수
//
//    var progressTimer : Timer!          //타이머를 위한 변수
//
//
//
//    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
//
//    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
//
//
//
//    //재생 아웃렛 변수
//
//    @IBOutlet weak var pvProgressPlay: UIProgressView!
//
//    @IBOutlet weak var lbCurrentTime: UILabel!
//
//    @IBOutlet weak var lbEndTime: UILabel!
//
//
//
//    @IBOutlet weak var btnPlay: UIButton!
//
//    @IBOutlet weak var btnPause: UIButton!
//
//    @IBOutlet weak var btnStop: UIButton!
//
//    @IBOutlet weak var slVolume: UISlider!
//
//
//
//
//
//
//
//    //녹음 아웃렛 변수
//
//
//
//    @IBOutlet weak var btnRecord: UIButton!
//
//    @IBOutlet weak var lbRecordTime: UILabel!
//
//
//
//    var audioReorder : AVAudioRecorder!
//
//    var isRecorderMode = false //현재는 재생 모드
//
//
//
//
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//
//
//
//
//        selectAudioFile()
//
//
//
//
//
//        if (!isRecorderMode) {
//
//
//
//            //오디오를 초기화 하는 함수
//
//            initPlay()
//
//            //녹음 버튼과 녹음 재생시간은 비활성화
//
//            btnRecord.isEnabled = false
//
//            lbRecordTime.isEnabled = false
//
//        }else{
//
//
//
//            initRecord()
//
//
//
//        }
//
//
//
//
//
//    }
//
//
//
//    //녹음기능 초기화 함수
//
//    func selectAudioFile() -> Void {
//
//
//        
//        //재생모드
//
//        if !isRecorderMode {
//
//            audioFile = Bundle.main.url(forResource: "music", withExtension: "mp3")
//
//        }else{//녹음모드
//
//            //녹음모드일 때는 새 파일인 recordFile.m4a가 생성 된다.
//
//            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
//
//
//
//
//
//
//
//        }
//
//    }
//
//    //녹음을 위한 초기화 함수 : 음질은 최대, 비트율 320kbps, 오디오 채널은 2, 샘플율은 44,100hz
//
//    func initRecord() -> Void {
//
//
//
//        let recordSettings = [
//
//            AVFormatIDKey : NSNumber(value : kAudioFormatAppleLossless as UInt32),
//
//            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
//
//            AVEncoderBitRateKey : 320000,
//
//            AVNumberOfChannelsKey : 2,
//
//            AVSampleRateKey : 44100.0] as [String : Any]
//
//
//
//        do {
//
//            // selectAudioFile 함수에서 저장한 audioFile을 url로 하는 audioRecorder 인스턴스를 생성
//
//            audioReorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
//
//        } catch let error as NSError {
//
//            print("error-initRecord:\(error)")
//
//        }
//
//        audioReorder.delegate = self
//
//        //박자관련
//
//        audioReorder.isMeteringEnabled = true
//
//
//
//        audioReorder.prepareToRecord()
//
//
//
//        slVolume.value = 1.0
//
//        audioPlayer.volume = slVolume.value
//
//        lbEndTime.text = convertNSTimeInterval2String(0)
//
//        lbCurrentTime.text = convertNSTimeInterval2String(0)
//
//        //버튼 모드 비활성화
//
//        setPlayButton(false, pause: false, stop: false)
//
//
//
//        let session = AVAudioSession.sharedInstance()
//
//
//
//        do {
//
//            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
//
//        } catch let error as NSError {
//
//            print("error-setcategory : \(error)")
//
//        }
//
//
//
//        do {
//
//            try session.setActive(true)
//
//        } catch let error as NSError {
//
//            print("error-setActive : \(error)")
//
//        }
//
//
//
//    }
//
//
//
//    //audioFile을 url로 하는 audioplayer 인스턴스 생성
//
//    // 입력파라미터인 오디오 파일이 없을 때에 대비하여 try catch문 사용한다.
//
//    func initPlay(){
//
//
//
//        //에러 처리
//
//        do {
//
//            audioPlayer = try AVAudioPlayer(contentsOf: audioFile) //오류발생 가능 함수
//
//        } catch let error as NSError { //오류타입
//
//            print("error-initplay : \(error)")  //오류타입에 대한 처리 구문
//
//        }
//
//
//
//        //슬라이더의 최대 불륨을 지정
//
//        slVolume.maximumValue =  MAX_VOLUME
//
//        //슬라이더의 불륨을 1.0으로 초기화
//
//        slVolume.value = 1.0
//
//        //프로그레스 뷰의 진행을 0으로 초기화
//
//        pvProgressPlay.progress = 0
//
//
//
//        //audioplayer의 델리게이트를 self로 한다.
//
//        audioPlayer.delegate = self
//
//        //prepareToplay 실행한다.
//
//        audioPlayer.prepareToPlay()
//
//        //오디오 플레이어의 블륨 초기화 한다.
//
//        audioPlayer.volume = slVolume.value
//
//
//
//        //오디오 파일의 재생시간인 audioplayer.duration값을 이 함수를 이용해서 텍스트에 출력
//
//        lbEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
//
//        //lbcurrentTime텍스트에는 이 함수를 이용해서 00:00이 출력되도록 한다.
//
//        lbCurrentTime.text = convertNSTimeInterval2String(0)
//
//
//
//        //play 버튼 활성화
//
//        //btnPlay.isEnabled = true
//
//        //btnPause.isEnabled = false
//
//        //btnStop.isEnabled = false
//
//
//
//
//
//        setPlayButton(true, pause: false, stop: false)
//
//    }
//
//    //
//
//    func setPlayButton(_ play:Bool, pause:Bool, stop:Bool) -> Void {
//
//        btnPlay.isEnabled = play
//
//        btnPause.isEnabled = pause
//
//        btnStop.isEnabled = stop
//
//    }
//
//
//
//    //00:00형태로 바꾸기 위해 timeinterval 값을 받아 문자열로 돌려보내는 함수
//
//    func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
//
//        //재생시간의 매개변수인 time값을 60으로 나눈 몫을 정수 값으로 변환하여 상수 min에 초기화
//
//        let min = Int(time/60)
//
//        //time값을 60으로 나눈 나머지 값을 정수 값으로 변환하여 상수 sec 값에 초기화 한다.
//
//        let sec = Int(time.truncatingRemainder(dividingBy: 60))
//
//        //이 두 값을 이용해서 "%02d:%02d" 형태의 문자열로 변환하여 상수에 초기화
//
//        let strTime = String(format: "%02d:%02d",min,sec)
//
//
//
//        return strTime
//
//
//
//    }
//
//
//
//
//
//    override func didReceiveMemoryWarning() {
//
//        super.didReceiveMemoryWarning()
//
//        // Dispose of any resources that can be recreated.
//
//    }
//
//
//
//    //재생 버튼
//
//    @IBAction func btnPlayAudio(_ sender: UIButton) {
//
//
//
//        //오디오 재생
//
//        audioPlayer.play()
//
//        //재생버튼 비활성화 나머지 버튼 활성화
//
//        setPlayButton(false, pause: true, stop: true)
//
//        //프로그레스 타이머 설정
//
//        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
//
//
//
//    }
//
//
//
//
//
//    //앞에서 만든 타이머에 의해 0.1초 간격으로 이 함수가 실행되는데, 그때마다 재생시간을 라벨과 프로그래스바에 보여준다.
//
//    @objc func updatePlayTime() -> Void {
//
//        lbCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
//
//        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
//
//    }
//
//
//
//    //일시정지버튼
//
//    @IBAction func btnPauseAudio(_ sender: UIButton) {
//
//        audioPlayer.pause()
//
//        setPlayButton(true, pause: false, stop: true)
//
//    }
//
//
//
//    //정지버튼
//
//    @IBAction func btnStopAudio(_ sender: UIButton) {
//
//        audioPlayer.stop()
//
//
//
//        //오디오를 정지하고 재생하면 다시 처음부터 재생, 시간 초기화
//
//        audioPlayer.currentTime = 0
//
//        lbCurrentTime.text = convertNSTimeInterval2String(0)
//
//        setPlayButton(true, pause: false, stop: false)
//
//        progressTimer.invalidate()
//
//
//
//    }
//
//
//
//    //음량 슬라이더 액션 함수
//
//    @IBAction func slChangeVolume(_ sender: UISlider) {
//
//
//
//        audioPlayer.volume = slVolume.value
//
//    }
//
//
//
//    //오디오 재생이 끝나면 맨 처음 상태로 돌아가도록 지정 하는 함수
//
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//
//        progressTimer.invalidate()
//
//        //재생버튼 활성화 나머지 버튼 비활성화
//
//        setPlayButton(true, pause: false, stop: false)
//
//    }
//
//
//
//
//
//    //녹음 스위치
//
//    @IBAction func swRecordMode(_ sender: UISwitch) {
//
//
//
//        //스위치가 녹음 모드일 때
//
//        if sender.isOn {
//
//
//
//            //오디오 재생 중지, 현재시간 00:00으로 설정, record값 참으로 설정 녹음 버튼과 시간 활성화
//
//            audioPlayer.stop()
//
//            audioPlayer.currentTime = 0
//
//            lbRecordTime!.text = convertNSTimeInterval2String(0)
//
//            isRecorderMode = true
//
//            btnRecord.isEnabled = true
//
//            lbRecordTime.isEnabled = true
//
//        }else{
//
//            //재생모드일 때, 레코드모드 값을 거짓으로 바꾸고, 녹음 버튼과 시간을 비활성화, 녹음 시간 0
//
//
//
//            isRecorderMode = false
//
//            btnRecord.isEnabled = false
//
//            lbRecordTime.isEnabled = false
//
//            lbRecordTime.text = convertNSTimeInterval2String(0)
//
//        }
//
//
//
//        //이 함수를 호출해서 오디오 파일을 선택하고 , 모드에 따라서 초기화 할 함수 호출
//
//        selectAudioFile()
//
//
//
//        if !isRecorderMode {
//
//            initPlay()
//
//        }else {
//
//
//
//            initRecord()
//
//
//
//        }
//
//
//
//    }
//
//    //녹음하기 버튼 함수
//
//    @IBAction func btnRecord(_ sender: UIButton) {
//
//
//
//        if sender.titleLabel?.text == "record"{
//
//            audioReorder.record()
//
//            sender.setTitle("stop", for: UIControlState())
//
//            progressTimer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
//
//        }else {
//
//
//
//            audioReorder.stop()
//
//            progressTimer.invalidate() //녹음이 정지되면 타이머 무효화
//
//            sender.setTitle("record", for: UIControlState())
//
//            btnPlay.isEnabled = true
//
//            initPlay()
//
//        }
//
//
//
//    }
//
//
//
//    @objc func updateRecordTime(){
//
//        lbRecordTime.text = convertNSTimeInterval2String(audioReorder.currentTime)
//
//    }
//
//}
//
//
