

import UIKit

class ViewController: UIViewController {
    
    let hsPopUp = UIViewController()
    
    var scores_recorded = [0,0,0,0,0]
    var gameType = ["", "", "", "", ""]
    
    var diffArr = ["", "", "", "", ""]
    
    @IBOutlet weak var MemoryBtn: UIButton!
    
    @IBOutlet weak var SortBtn: UIButton!
    
    
    @IBOutlet weak var BalloonBtn: UIButton!
    
    
    @IBOutlet weak var easyBtn: UIButton!
    
    @IBOutlet weak var medBtn: UIButton!
    
    @IBOutlet weak var hardBtn: UIButton!
    
    
    @IBOutlet weak var nav: UINavigationItem!
    
    static var label1 = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 48))
    
    static var label2 = UILabel(frame: CGRect(x: 100, y: 98, width: 200, height: 48))
    static var label3 = UILabel(frame: CGRect(x: 100, y: 146, width: 200, height: 48))
    
    static var label4 = UILabel(frame: CGRect(x: 100, y: 194, width: 200, height: 48))
    
   static var label5 = UILabel(frame: CGRect(x: 100, y: 242, width: 200, height: 48))
    
    
   static var diff = " "
    static var game = " "
    var diff = " "
    var game = " "

    

    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        
        
        ViewController.label1.text = "1:  "
        ViewController.label2.text = "2:   "
        ViewController.label3.text = "3:  "
        ViewController.label4.text = "4:  "
        ViewController.label5.text = "5:  "
      
        
        
        
        
        // self.navigationController?.navigationBar.topItem?.title = " Sfasdfds"
        
        
        diff = " "
        game = " "

        view.backgroundColor = UIColor(patternImage: UIImage(named: "back-main")!).withAlphaComponent(0.5)

        
//        let check: UIBarButtonItem = UIBarButtonItem()
//        check.title = "Check"
//        check.width = CGFloat(100)
//        check.tintColor = UIColor.green
//        check.action = #selector(ViewController.checkTapped)
//        check.target = self
//        
        

        
        // then we add the button to the navigation bar
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "High Score", style: .plain, target: self, action: #selector(showHigh))
        
        initializeUserDefaults()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    
    
    
   
    @IBAction func MemoryBut(_ sender: Any) {
      ViewController.game = "memory"
//     game = "memory"
       
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlpha), userInfo: nil, repeats: false)
     //MemoryBtn.alpha = 0.5
     
    
        
    }
    
    
    
    @IBAction func SortingBut(_ sender: Any) {
       ViewController.game = "sorting"
        //game = "sorting"
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlphaSort), userInfo: nil, repeats: false)
        
        
        //SortBtn.alpha = 0.5
    }
    
    
    @IBAction func ButtonBut(_ sender: Any) {
       ViewController.game = "balloon"
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlphaBall), userInfo: nil, repeats: false)
        
        
       // game = "balloon"
       // BalloonBtn.alpha = 0.5
    }

    
    @IBAction func easyBut(_ sender: Any) {
        
        ViewController.diff = "easy"
       // diff = "easy"
       // easyBtn.alpha = 0.5
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlphaEasy), userInfo: nil, repeats: false)
        
    }
    
    
    @IBAction func mediumBut(_ sender: Any) {
        ViewController.diff = "medium"
        //diff = "medium"
        //medBtn.alpha = 0.5
        
         let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlphaMedium), userInfo: nil, repeats: false)
        
    }
    
    
    @IBAction func hardBut(_ sender: Any) {
        ViewController.diff = "hard"
        //diff = "hard"
        //hardBtn.alpha = 0.5
         let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeAlphaHard), userInfo: nil, repeats: false)
        
    }
    
    
    
    @IBAction func PlayBut(_ sender: Any) {
        
        
        if ViewController.diff != " " && ViewController.game != " " {
            if ViewController.game == "memory" {
                self.performSegue(withIdentifier: "match", sender: self)
                }
            if ViewController.game == "sorting" {
                self.performSegue(withIdentifier: "sort", sender: self)
            }
            if ViewController.game == "balloon" {
                self.performSegue(withIdentifier: "balloon", sender: self)
            }
        
        
    }
    
    
    
    }
    
    


  
//    func highButton() {
//    
//     let highButton = UIBarButtonItem()
//     self.navigationItem.rightBarButtonItem = highButton
//        highButton.target = self;
//        highButton.action = #selector(barButtonCustomPressed)
//    
//     
//        
//    
//    
//    }
//    
    
    
    
    
    func checkTapped (sender:UIButton) {
        print("check pressed")
    }
    
    
    func showHigh() {
        
       // self.navigationController?.navigationBar.topItem?.title = "Cancel"
        
        
        scores_recorded = UserDefaults.standard.array(forKey: "sA") as! [Int]
        gameType = UserDefaults.standard.array(forKey: "gA") as! [String]
        diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]

        
        
        
        var cancel_button = UIButton(frame: CGRect(x: 100, y: 2, width: 300, height: 48))
        cancel_button.backgroundColor = UIColor.blue
        cancel_button.titleLabel?.text = "CANCEL"
        cancel_button.titleLabel?.textColor = UIColor.black
        cancel_button.setTitle("CANCEL", for: .normal)
        
        
        
        
        
        cancel_button.addTarget(self, action: #selector(Click), for: .touchUpInside)
        
        
        
        
        
        
        
        
        //navigationItem.backBarButtonItem?.title = "Cancel"
        
        hsPopUp.modalPresentationStyle = .popover
        hsPopUp.modalTransitionStyle = .coverVertical
        
        hsPopUp.preferredContentSize = CGSize(width: 500, height: 300)
        
        hsPopUp.view.addSubview(cancel_button)
        hsPopUp.view.addSubview(ViewController.label1)
        hsPopUp.view.addSubview(ViewController.label2)
        hsPopUp.view.addSubview(ViewController.label3)
        hsPopUp.view.addSubview(ViewController.label4)
        hsPopUp.view.addSubview(ViewController.label5)
        
        
        let midView = UIView(frame: CGRect(x: 250, y: 338, width: 0, height: 0))
        self.view.addSubview(midView)
        
        let pop = hsPopUp.popoverPresentationController
        pop?.sourceView = midView
        
        ViewController.label1.text = "1: \(scores_recorded[4]) \(gameType[4]) \(diffArr[4]) "
        ViewController.label2.text = "2: \(scores_recorded[3]) \(gameType[3]) \(diffArr[3])  "
        ViewController.label3.text = "3: \(scores_recorded[2]) \(gameType[2]) \(diffArr[2]) "
         ViewController.label4.text = "4: \(scores_recorded[1]) \(gameType[1]) \(diffArr[1]) "
        ViewController.label5.text = "5: \(scores_recorded[0]) \(gameType[0]) \(diffArr[0]) "

        //show(highScorePage, sender: midView)
        
        self.present(hsPopUp, animated: true, completion: {
            _ in self.hsPopUp.removeFromParentViewController()
            midView.removeFromSuperview()
        
        
        })
        
        
        
    
    }
  
    func Click() {
        self.hsPopUp.dismiss(animated: true, completion: nil)
    }
    
    func changeAlpha() {
        MemoryBtn.alpha = 0.5
        MemoryBtn.alpha = 1.0
    
    }
    
    func changeAlphaSort() {
        SortBtn.alpha = 0.5
        SortBtn.alpha = 1.0
    
    
    
    }
    
    func changeAlphaBall() {
        BalloonBtn.alpha = 0.5
        BalloonBtn.alpha = 1.0
    
    
    }
    
    
    func changeAlphaEasy() {
        easyBtn.alpha = 0.5
        easyBtn.alpha = 1.0
        
        
    }
    
    func changeAlphaMedium() {
        medBtn.alpha = 0.5
        medBtn.alpha = 1.0
        
        
    }
    
    
    func changeAlphaHard() {
        hardBtn.alpha = 0.5
        hardBtn.alpha = 1.0
        
        
    }
    
    
    
    
    
    func initializeUserDefaults()
    {
        if UserDefaults.standard.value(forKeyPath: "sA") == nil
        {
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
        }
        if UserDefaults.standard.value(forKeyPath: "gA") == nil
        {
            UserDefaults.standard.set(gameType, forKey: "gA")
        }
        if UserDefaults.standard.value(forKeyPath: "dA") == nil
        {
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
    }
    
    func updateHighScores(sc: Int, g: String, diff: String)
    {
        scores_recorded = UserDefaults.standard.array(forKey: "sA") as! [Int]
        gameType = UserDefaults.standard.array(forKey: "gA") as! [String]
        diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]
        
        if sc > scores_recorded[0]
        {
            for i in 4...1
            {
                scores_recorded[i] = scores_recorded[i-1]
                gameType[i] = gameType[i-1]
                diffArr[i] = diffArr[i-1]
            }
            scores_recorded[0] = sc
            gameType[0] = g
            diffArr[0] = diff
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
            UserDefaults.standard.set(gameType, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scores_recorded[1]
        {
            for i in 4...2
            {
                scores_recorded[i] = scores_recorded[i-1]
                gameType[i] = gameType[i-1]
                diffArr[i] = diffArr[i-1]
            }
            scores_recorded[1] = sc
            gameType[1] = game
            diffArr[1] = diff
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
            UserDefaults.standard.set(gameType, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scores_recorded[2]
        {
            for i in 4...3
            {
                scores_recorded[i] = scores_recorded[i-1]
                gameType[i] = gameType[i-1]
                diffArr[i] = diffArr[i-1]
            }
            scores_recorded[2] = sc
            gameType[2] = g
            diffArr[2] = diff
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
            UserDefaults.standard.set(gameType, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scores_recorded[3]
        {
            
            scores_recorded[4] = scores_recorded[3]
            gameType[4] = gameType[3]
            diffArr[4] = diffArr[3]
            scores_recorded[3] = sc
            gameType[3] = g
            diffArr[3] = diff
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
            UserDefaults.standard.set(gameType, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scores_recorded[4]
        {
            scores_recorded[4] = sc
            gameType[4] = game
            diffArr[4] = diff
            UserDefaults.standard.set(scores_recorded, forKey: "sA")
            UserDefaults.standard.set(gameType, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
    }}

