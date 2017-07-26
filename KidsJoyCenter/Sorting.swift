
import UIKit

class Sorting: UIViewController {
    
   
    var gT = Timer()
    var sT = Timer()
    
    var scClock = 0
    var game = 0
    var scTracker = 0
    
    
    
    var vehicles = [UIImage]()
    var play = [Int]()
    var tags = [Int]()
    
    var minTime = UIView()
    var colon = UIView()
    var tenthTime = UIView()
    var oneTime = UIView()
    
    
    var easyLoc = [Int]()
    
    
    var medLoc = [Int]()
    var hardLocations = [Int]()
    
    var hundredScore = UIView()
    var tenthsScore = UIView()
    var onesScore = UIView()
    
    var scoreArr = [0,0,0,0,0]
    var gameArray = ["", "", "", "", ""]
    var diffArr = ["", "", "", "", ""]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scTotal = 0
        scTracker = 0
        
        
        gT = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseGT), userInfo: nil, repeats: true)
        
        sT = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(increaseScClock), userInfo: nil, repeats: true)
        
        
        let backgroundImage = UIImageView(frame: CGRect(x:0, y: 0, width: CGFloat(1024), height: CGFloat(768)))
        
        backgroundImage.image = #imageLiteral(resourceName: "air-land-water")
        self.view.addSubview(backgroundImage)
        backgroundImage.tag = 20
        
        
        easyLoc = [90, 180, 270, 360, 450, 540, 630, 720]
        medLoc = [80, 160, 240, 320, 400, 480, 560, 640, 720, 800]
        hardLocations = [60, 120, 180, 240, 300, 360, 420, 480, 540, 600, 660, 720]
        vehicles = [#imageLiteral(resourceName: "lanFirst"), #imageLiteral(resourceName: "lanSecond"), #imageLiteral(resourceName: "landThird"), #imageLiteral(resourceName: "landFourth"), #imageLiteral(resourceName: "landFifth"), #imageLiteral(resourceName: "sea1"), #imageLiteral(resourceName: "seaSecond"), #imageLiteral(resourceName: "seathird"), #imageLiteral(resourceName: "seaFourth"), #imageLiteral(resourceName: "seaFifth"), #imageLiteral(resourceName: "firstAir"), #imageLiteral(resourceName: "secondAir"),#imageLiteral(resourceName: "thirdAir"), #imageLiteral(resourceName: "fourthAir"), #imageLiteral(resourceName: "fifthAir")]
        
        
        tags = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
        play = [Int]()
        
        
        if ViewController.diff == "easy"
        {
            game = 60
        }
        else if ViewController.diff == "medium"
        {
            game = 45
        }
        else
        {
            game = 30
        }

        
        
        
        let ScoreDisplay = UIImageView(frame: CGRect(x: 700, y: 600, width: 140, height: 48))
        ScoreDisplay.image = #imageLiteral(resourceName: "score")
        self.view.addSubview(ScoreDisplay)
        ScoreDisplay.tag = 20
        
        
        let time =  UIImageView(frame: CGRect(x: 0, y: 600, width: 140, height: 48))
        time.image = #imageLiteral(resourceName: "time")
         self.view.addSubview(time)
        time.tag = 20
      
        
        
        
        
        
        minTime = UIImageView(frame: CGRect(x: 140, y: 600, width: 35, height: 48))
        minTime.backgroundColor = UIColor.white
        minTime.tag = 20
        view.addSubview(minTime)
        colon = UIImageView(frame: CGRect(x: 175, y: 600, width: 35, height: 48))
        colon.backgroundColor =  UIColor(patternImage: UIImage(named: "colon")!).withAlphaComponent(1.0)
        colon.tag = 20
        self.view.addSubview(colon)
        tenthTime = UIImageView(frame: CGRect(x: 210, y: 600, width: CGFloat(35), height: CGFloat(48)))
        tenthTime.backgroundColor =  UIColor.white
        tenthTime.tag = 20
        self.view.addSubview(tenthTime)
        oneTime = UIImageView(frame: CGRect(x: 245, y: 600, width: 35, height: 48))
        oneTime.backgroundColor =  UIColor.white
        oneTime.tag = 20
        self.view.addSubview(oneTime)
        hundredScore = UIImageView(frame: CGRect(x: 840, y: 600, width: 35, height: 48))
        hundredScore.backgroundColor = UIColor.white
        hundredScore.tag = 20
        self.view.addSubview(hundredScore)
        tenthsScore = UIImageView(frame: CGRect(x: 875, y: 600, width: 35, height: 48))
        tenthsScore.backgroundColor = UIColor.white
        tenthsScore.tag = 20
        self.view.addSubview(tenthsScore)
        onesScore = UIImageView(frame: CGRect(x: 910, y: 600, width: 35, height: 48))
        onesScore.backgroundColor = UIColor.white
        onesScore.tag = 20
        self.view.addSubview(onesScore)
        
        
        
        
        
        
        
        loadGameArr()
        GameLoad()
        
        
        
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //popUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var scTotal = 0
    
    
    
    
    
    func loadGameArr()
    {
        var random = 0
        if ViewController.diff == "easy"
        {
            for _ in 0 ..< 8
            {
                random = (Int)(arc4random() % (UInt32)(tags.count))
                play.append(tags[random])
                tags.remove(at: random)
            }
        }
        else if ViewController.diff == "medium"
        {
            for _ in 0 ..< 10
            {
                random = (Int)(arc4random() % (UInt32)(tags.count))
                play.append(tags[random])
                tags.remove(at: random)
            }
        }
        else
        {
            for _ in 0 ..< 12
            {
                random = (Int)(arc4random() % (UInt32)(tags.count))
                play.append(tags[random])
                tags.remove(at: random)
            }
        }
    }
    
    func GameLoad()
    {
        if ViewController.diff == "easy"
        {
            for i in 0 ..< 8
            {
                let a = easyLoc[i]
                let b = 60
                let c = 60
                let d = 60
                
                let gIm = UIImageView(frame: CGRect(x:CGFloat(a), y: CGFloat(b), width: CGFloat(c), height: CGFloat(d)))
                
                gIm.image = vehicles[play[i]]
                gIm.isUserInteractionEnabled = true
                
                
                self.view.addSubview(gIm)
                gIm.tag = play[i]
            }
        }
        else if ViewController.diff == "medium"
        {
            for i in 0 ..< 10
            {
                let a = medLoc[i]
                let b = 60
                let c = 60
                let d = 60
                
               
                let gIm = UIImageView(frame: CGRect(x:CGFloat(a), y: CGFloat(b), width: CGFloat(c), height: CGFloat(d)))
                
                gIm.image = vehicles[play[i]]
                gIm.isUserInteractionEnabled = true
                
                
                self.view.addSubview(gIm)
                gIm.tag = play[i]
            }
        }
        else
        {
            for i in 0 ..< 12
            {
                let a = hardLocations[i]
                let b = 60
                let c = 60
                let d = 60
                
                
                let gIm = UIImageView(frame: CGRect(x:CGFloat(a), y: CGFloat(b), width: CGFloat(c), height: CGFloat(d)))
                
                gIm.image = vehicles[play[i]]
                gIm.isUserInteractionEnabled = true
                
                
                self.view.addSubview(gIm)
                gIm.tag = play[i]
            }
        }
    }
    
   
    
    
    func decreaseGT()
    {
        game = game - 1
        
        
        var tenths = game / 10
        var ones = game % 10
        
        
        if tenths == 5 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        if tenths == 4 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        if tenths == 3 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        if tenths == 2 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        if tenths == 1 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        if tenths == 0 {
            tenthTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }
        if ones == 9 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        if ones == 8 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        if ones == 7 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        if ones == 6 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        if ones == 5 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        if ones == 4 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        if ones == 3 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        if ones == 2 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        if ones == 1 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        if ones == 0 {
            oneTime.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }

        
        
        
        
        
        
        
        
        
        
        if game == 0
        {
            lost()
        }
    }
    
    func increaseScClock()
    {
        scClock+=1
    }
    
    func won()
    {
        self.view.layer.removeAllAnimations()
        gT.invalidate()
        sT.invalidate()
        updateHighScores(sc: scTotal, g: "Sorting", diff: ViewController.diff)
        
        
        
        let won = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
        
        won.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in won.dismiss(animated: true, completion: nil)
            
            self.viewDidLoad()
            
        }))
        
        won.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in won.dismiss(animated: true, completion: nil)
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
        }))
        
        self.present(won, animated: true, completion: nil)
        

        
        
        
        
        
        
    }
    
    func lost()
    {
        self.view.layer.removeAllAnimations()
        gT.invalidate()
        sT.invalidate()
        
        let timeUp = UIAlertController(title: "Time's Up", message: "You lost :(", preferredStyle: UIAlertControllerStyle.alert)
        
        timeUp.addAction(UIAlertAction(title: "Play Another Game", style: UIAlertActionStyle.default, handler: { (action) in timeUp.dismiss(animated: true, completion: nil)
            
            self.viewDidLoad()
            
        }))
        //
        timeUp.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in timeUp.dismiss(animated: true, completion: nil)
            
            //   self.performSegue(withIdentifier: "goHome", sender: self)
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
            
        }))
        
        
        self.present(timeUp, animated: true, completion: nil)

        
        
        
        
        
    }
    
    func countScore()
    {
        if scClock < 3
        {
            scTotal += 5
        }
        else if scClock < 5
        {
            scTotal += 4
        }
        else
        {
            scTotal += 3
        }
        
        scClock = 0
       
        
        var hund = scTotal / 100
        var ten =  scTotal % 100
        var tenths = ten / 10
        var ones =  ten % 10
        
        
        
        if hund == 9 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        if hund == 8 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        if hund == 7 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        if hund == 6 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        if hund == 5 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        if hund == 4 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        if hund == 3 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        if hund == 2 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        if hund == 1 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        if hund == 0 {
            hundredScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }
        
        
        
        
        if tenths == 9 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        if tenths == 8 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        if tenths == 7 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        if tenths == 6 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        if tenths == 5 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        if tenths == 4 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        if tenths == 3 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        if tenths == 2 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        if tenths == 1 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        if tenths == 0 {
            tenthsScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }
        
        
        if ones == 9 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        if ones == 8 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        if ones == 7 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        if ones == 6 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        if ones == 5 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        if ones == 4 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        if ones == 3 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        if ones == 2 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        if ones == 1 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        if ones == 0 {
            onesScore.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }
        
        
      
        
        scTracker += 1
        if ViewController.diff == "easy"
        {
            if scTracker == 8
            {
                won()
            }
        }
        else if ViewController.diff == "medium"
        {
            if scTracker == 10
            {
                won()
            }
        }
        else
        {
            if scTracker == 12
            {
                won()
            }
        }
        
        
       
        
    }
    
    func updateHighScores(sc: Int, g: String, diff: String)
    {
        scoreArr = UserDefaults.standard.array(forKey: "sA") as! [Int]
        gameArray = UserDefaults.standard.array(forKey: "gA") as! [String]
        diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]
        
        if sc > scoreArr[4]
        {
            for i in 0...3
            {
                scoreArr[i] = scoreArr[i+1]
                gameArray[i] = gameArray[i+1]
                diffArr[i] = diffArr[i+1]
            }
            scoreArr[4] = sc
            gameArray[4] = g
            diffArr[4] = diff
            UserDefaults.standard.set(scoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArray, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scoreArr[3]
        {
            for i in 0...2
            {
                scoreArr[i] = scoreArr[i+1]
                gameArray[i] = gameArray[i+1]
                diffArr[i] = diffArr[i+1]
            }
            scoreArr[3] = sc
            gameArray[3] = g
            diffArr[3] = diff
            UserDefaults.standard.set(scoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArray, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scoreArr[2]
        {
            for i in 0...1
            {
                scoreArr[i] = scoreArr[i+1]
                gameArray[i] = gameArray[i+1]
                diffArr[i] = diffArr[i+1]
            }
            scoreArr[2] = sc
            gameArray[2] = g
            diffArr[2] = diff
            UserDefaults.standard.set(scoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArray, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scoreArr[1]
        {
            
            scoreArr[0] = scoreArr[1]
            gameArray[0] = gameArray[1]
            diffArr[0] = diffArr[1]
            scoreArr[1] = sc
            gameArray[1] = g
            diffArr[1] = diff
            UserDefaults.standard.set(scoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArray, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > scoreArr[0]
        {
            scoreArr[0] = sc
            gameArray[0] = g
            diffArr[0] = diff
            UserDefaults.standard.set(scoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArray, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
       
    }
    
    
    func animE(v: UIView, location: Int){
        
        let fast = 2
        
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            v.frame.origin.y = 60
            v.frame.origin.x = CGFloat(self.easyLoc[location])
        }, completion:
            {_ in self.view.isHidden = false})
    }
    
    func animMed(v: UIView, location: Int){
        
        let fast = 2
        
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            v.frame.origin.y = 60
            v.frame.origin.x = CGFloat(self.medLoc[location])
        }, completion:
            {_ in self.view.isHidden = false})
    }
    
    func animH(v: UIView, location: Int){
        
        let fast = 2
        
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            v.frame.origin.y = 60
            v.frame.origin.x = CGFloat(self.hardLocations[location])
        }, completion:
            {_ in self.view.isHidden = false})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        let t = touches.first
        let tL = t!.location(in: self.view)
        for i in 1...self.view.subviews.count
        {
            if self.view.subviews[i-1].tag < 20
            {
                if self.view.subviews[i-1].layer.presentation()!.hitTest(tL) != nil
                {
                    
                    self.view.subviews[i-1].center = tL
                }
            }
        }
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let t = touches.first
        let tL = t!.location(in: self.view)
        for i in 1...self.view.subviews.count {
            if self.view.subviews[i-1].tag < 20
            {
                if self.view.subviews[i-1].layer.presentation()!.hitTest(tL) != nil
                {
                    self.view.subviews[i-1].center = tL
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 6...self.view.subviews.count
        {
            if (self.view.subviews[i-1].tag < 5 && self.view.subviews[i-1].frame.origin.x > 725 && self.view.subviews[i-1].frame.origin.y > 400) || (self.view.subviews[i-1].tag < 5 && self.view.subviews[i-1].frame.origin.x > 475 && self.view.subviews[i-1].frame.origin.y > 575)
            {
                
                //Count score once
                countScore()
                self.view.subviews[i-1].tag = 20
                self.view.subviews[i-1].isUserInteractionEnabled = false
                /////
            }
            else if (self.view.subviews[i-1].tag < 10 && self.view.subviews[i-1].frame.origin.x < 700 && self.view.subviews[i-1].frame.origin.y > 400 && self.view.subviews[i-1].frame.origin.y < 575) || (self.view.subviews[i-1].tag < 10 && self.view.subviews[i-1].frame.origin.x < 475 && self.view.subviews[i-1].frame.origin.y > 575)
            {
                
                
                //count score twice
                countScore()
                self.view.subviews[i-1].tag = 20
                self.view.subviews[i-1].isUserInteractionEnabled = false
                ////
            }
            else if (self.view.subviews[i-1].tag < 15 && self.view.subviews[i-1].tag > 9 && self.view.subviews[i-1].frame.origin.y < 400 && self.view.subviews[i-1].frame.origin.y > 80)
            {
                ///third count score
                countScore()
                self.view.subviews[i-1].tag = 20
                self.view.subviews[i-1].isUserInteractionEnabled = false
            }
            else if self.view.subviews[i-1].tag < 20 && self.view.subviews[i-1].frame.origin.y > 80
            {
                
                //frames for difficulty 
                
                if ViewController.diff == "easy"
                {
                    animE(v: self.view.subviews[i-1], location: i-14)
                }
                else if ViewController.diff == "medium"
                {
                    animMed(v: self.view.subviews[i-1], location: i-14)
                }
                else
                {
                    animH(v: self.view.subviews[i-1], location: i-14)
                }
            }}}}

