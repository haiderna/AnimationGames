


import UIKit
import AVFoundation

class BalloonsGame: UIViewController {
    
    
     static var speed = 7
    
    var popper = AVAudioPlayer()
    
    var startTime = Timer()
    var GameOver = Timer()
    
    var sp = Timer()
    
    var gT = Timer()
    
    var lT = Timer()
    
    
    
    var hundredScore = UIView()
    var tenthsScore = UIView()
    var onesScore = UIView()
    
    
    
   
    var gArr = ["", "", "", "", ""]
    
    var diffArr = ["", "", "", "", ""]
    var game = 0
    var ScoreArr = [0,0,0,0,0]
    var loser = 10
    
    var minTime = UIView()
    var colon = UIView()
    var tenthTime = UIView()
    var oneTime = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
          scTotal = 0
        
        
        
        if ViewController.diff == "easy"
        {
            startTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(plusBall), userInfo: nil, repeats: true)
        }
        else if ViewController.diff == "medium"
        {
            startTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Med), userInfo: nil, repeats: true)
        }
        else
        {
            startTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(hard), userInfo: nil, repeats: true)
        }
        
        GameOver = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(plusKill), userInfo: nil, repeats: true)
        
        sp = Timer.scheduledTimer(timeInterval: 25.0, target: self, selector: #selector(addSp), userInfo: nil, repeats: true)
        
        gT = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseGT), userInfo: nil, repeats: true)
        
        lT = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseLT), userInfo: nil, repeats: true)
        
        
        
        let searchLocation = Bundle.main.path(forResource: "pop", ofType: "mp3")
        
        do{
            popper = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: searchLocation!))
        }
        catch{
            print("error")
        }
        
       
        
        
        let back = UIView(frame: CGRect(x:0, y: 0, width: 1024, height:765))
        back.backgroundColor = UIColor(patternImage: UIImage(named: "sky-background")!).withAlphaComponent(1.0)
        self.view.addSubview(back)
        back.tag = 20
        
        
        
        
        
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

        
        
        
       
        
        let ptImage = UIImageView(frame: CGRect(x: CGFloat(700), y: CGFloat(60), width: CGFloat(150), height: CGFloat(48)))
        ptImage.backgroundColor = UIColor(patternImage: UIImage(named: "score")!).withAlphaComponent(1.0)
         ptImage.tag = 13
        self.view.addSubview(ptImage)
         let timeImage = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(60), width: CGFloat(150), height: CGFloat(48)))
       timeImage.backgroundColor = UIColor(patternImage: UIImage(named: "time")!).withAlphaComponent(1.0)
       timeImage.tag = 13
        self.view.addSubview(timeImage)
       minTime = UIImageView(frame: CGRect(x: CGFloat(150), y: CGFloat(60), width: CGFloat(41), height: CGFloat(48)))
        minTime.backgroundColor = UIColor.white
        minTime.tag = 13
        view.addSubview(minTime)
        colon = UIImageView(frame: CGRect(x: CGFloat(191), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        colon.backgroundColor =  UIColor(patternImage: UIImage(named: "colon")!).withAlphaComponent(1.0)
        colon.tag = 13
        self.view.addSubview(colon)
        tenthTime = UIImageView(frame: CGRect(x: CGFloat(226), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        tenthTime.backgroundColor =  UIColor.white
        tenthTime.tag = 13
        self.view.addSubview(tenthTime)
        oneTime = UIImageView(frame: CGRect(x: CGFloat(258), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        oneTime.backgroundColor =  UIColor.white
        oneTime.tag = 13
        self.view.addSubview(oneTime)
        hundredScore = UIImageView(frame: CGRect(x: CGFloat(850), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        hundredScore.backgroundColor = UIColor.white
        hundredScore.tag = 13
        self.view.addSubview(hundredScore)
        tenthsScore = UIImageView(frame: CGRect(x: CGFloat(885), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        tenthsScore.backgroundColor = UIColor.white
        tenthsScore.tag = 13
        self.view.addSubview(tenthsScore)
        onesScore = UIImageView(frame: CGRect(x: CGFloat(920), y: CGFloat(60), width: CGFloat(35), height: CGFloat(48)))
        onesScore.backgroundColor = UIColor.white
        onesScore.tag = 13
        self.view.addSubview(onesScore)
        
        
        
        
        
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    let balloonColors = [#imageLiteral(resourceName: "color1"), #imageLiteral(resourceName: "color2"), #imageLiteral(resourceName: "color3"), #imageLiteral(resourceName: "color4"), #imageLiteral(resourceName: "color5"), #imageLiteral(resourceName: "color6"), #imageLiteral(resourceName: "color7"), #imageLiteral(resourceName: "color8"), #imageLiteral(resourceName: "color9"), #imageLiteral(resourceName: "color10")]

    var scoreSoFar = [Int]()
    var scTotal = 0
    
    let xPositions = [80, 160, 240, 320, 400, 480, 560, 640, 720, 800]
    
    
    let cartoonNumbers = [#imageLiteral(resourceName: "cartoon-number-1"), #imageLiteral(resourceName: "cartoon-number-2"), #imageLiteral(resourceName: "cartoon-number-3"), #imageLiteral(resourceName: "cartoon-number-4"), #imageLiteral(resourceName: "cartoon-number-5"), #imageLiteral(resourceName: "cartoon-number-6"), #imageLiteral(resourceName: "cartoon-number-7"), #imageLiteral(resourceName: "cartoon-number-8"), #imageLiteral(resourceName: "cartoon-number-9")]
    
   
   
    
    
    
    
    
    
    
   
    
    func plusBall(){
        
        var random = 0
        
        let width = 80
        let height = 90
        let x = (xPositions[(Int)(arc4random() % 10)])
        let y = 700
        
        let baloon = UIImageView(frame: CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height)))
        let value = UIImageView(frame: CGRect(x: CGFloat(20), y: CGFloat(20), width: CGFloat(width-40), height: CGFloat(height-40)))
        
        baloon.image = (balloonColors[(Int)(arc4random() % 10)])
        
        if ViewController.diff == "easy"
        {
            random = (Int)(arc4random() % 9)
            value.image = (cartoonNumbers[random])
            scoreSoFar.append(random+1)
            
        }
        else if ViewController.diff == "medium"
        {
            random = (Int)(arc4random() % 7)
            value.image = (cartoonNumbers[random])
            scoreSoFar.append(random+1)
        }
        else
        {
            random = (Int)(arc4random() % 5)
            value.image = (cartoonNumbers[random])
            scoreSoFar.append(random+1)
            
        }
        self.view.addSubview(baloon)
        baloon.addSubview(value)
        baloon.tag = random + 1
        
        animBall(view:baloon)
        
        
    }
    
    func Med()
    {
        var random = (Int)(arc4random() % 2 + 1)
        if random == 1
        {
            plusBall()
        }
        else
        {
            plusBall()
            plusBall()
        }
    }
    
    func hard()
    {
        var random = (Int)(arc4random() % 3 + 1)
        if random == 1
        {
            plusBall()
        }
        else if random == 2
        {
            plusBall()
            plusBall()
        }
        else
        {
            plusBall()
            plusBall()
            plusBall()
        }
    }
    
    func plusKill()
    {
        let width = 80
        let height = 90
        let a = (xPositions[(Int)(arc4random() % 10)])
        let b = 700
        
        
        
        let killerBall = UIImageView(frame: CGRect(x: CGFloat(a), y: CGFloat(b), width: CGFloat(width), height: CGFloat(height)))
        let value = UIImageView(frame: CGRect(x: CGFloat(20), y: CGFloat(20), width: CGFloat(width-40), height: CGFloat(height-40)))
        
        killerBall.image = #imageLiteral(resourceName: "color3")
        value.image = #imageLiteral(resourceName: "bomb")
        
        self.view.addSubview(killerBall)
        killerBall.addSubview(value)
        killerBall.tag = 12
        
        animKill(view:killerBall)
    }
    
    func addSp()
    {
        let width = 80
        let height = 90
        let ex = (xPositions[(Int)(arc4random() % 10)])
        let why = 700
        
        let specialBall = UIImageView(frame: CGRect(x: CGFloat(ex), y: CGFloat(why), width: CGFloat(width), height: CGFloat(height)))
        
        let value = UIImageView(frame: CGRect(x: CGFloat(20), y: CGFloat(20), width: CGFloat(width-40), height: CGFloat(height-40))
)
        
        specialBall.image = #imageLiteral(resourceName: "color7")
        value.image = #imageLiteral(resourceName: "star")
        
        self.view.addSubview(specialBall)
        specialBall.addSubview(value)
        specialBall.tag = 11
        
        animSp(_l: specialBall)
 
        
        
    }
    
    func cont()
    {
        BalloonsGame.speed = BalloonsGame.speed - 5
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
            win()
        }
    }
    
    func decreaseLT()
    {
        loser = loser - 1
        if loser == 0
        {
            lose()
        }
    }
    
    func win()
    {
        self.view.layer.removeAllAnimations()
        startTime.invalidate()
        sp.invalidate()
        GameOver.invalidate()
        gT.invalidate()
        lT.invalidate()
        updateHighScores(sc: scTotal, game: "Balloons", diff: ViewController.diff)
        
        
        let won = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
        
        won.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in won.dismiss(animated: true, completion: nil)
            
            self.viewDidLoad()
            
        }))
        //
        won.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in won.dismiss(animated: true, completion: nil)
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
        }))
        
        self.present(won, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
    func lose()
    {
        self.view.layer.removeAllAnimations()
        startTime.invalidate()
        sp.invalidate()
        GameOver.invalidate()
        gT.invalidate()
        lT.invalidate()
        
        
        let timeUp = UIAlertController(title: "Game Over", message: "You lost :(", preferredStyle: UIAlertControllerStyle.alert)
        
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
    
    
    func updateHighScores(sc: Int, game: String, diff: String)
    {
        ScoreArr = UserDefaults.standard.array(forKey: "sA") as! [Int]
        gArr = UserDefaults.standard.array(forKey: "gA") as! [String]
        diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]
        
        if sc > ScoreArr[4]
        {
            for i in 0...3
            {
                ScoreArr[i] = ScoreArr[i+1]
                gArr[i] = gArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[4] = sc
            gArr[4] = game
            diffArr[4] = diff
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[3]
        {
            for i in 0...2
            {
                ScoreArr[i] = ScoreArr[i+1]
                gArr[i] = gArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[3] = sc
            gArr[3] = game
            diffArr[3] = diff
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[2]
        {
            for i in 0...1
            {
                ScoreArr[i] = ScoreArr[i+1]
                gArr[i] = gArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[2] = sc
            gArr[2] = game
            diffArr[2] = diff
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[1]
        {
            
            ScoreArr[0] = ScoreArr[1]
            gArr[0] = gArr[1]
            diffArr[0] = diffArr[1]
            ScoreArr[1] = sc
            gArr[1] = game
            diffArr[1] = diff
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[0]
        {
            ScoreArr[0] = sc
            gArr[0] = game
            diffArr[0] = diff
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
       
    }
    
    
    
    func animBall(view: UIView){
        
        var fast = 0
        if ViewController.diff == "easy"
        {
            fast = BalloonsGame.speed
        }
        else if ViewController.diff == "medium"
        {
            fast = BalloonsGame.speed - 2
        }
        else
        {
            fast = BalloonsGame.speed - 4
        }
        
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            view.frame.origin.y = 0
        }, completion:
            {_ in view.removeFromSuperview()})
    }
    
   
    func animKill(view: UIView){
        
        var fast = 0
        if ViewController.diff == "easy"
        {
            fast = BalloonsGame.speed + 2
        }
        else if ViewController.diff == "medium"
        {
            fast = BalloonsGame.speed
        }
        else
        {
            fast = BalloonsGame.speed - 2
        }
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            view.frame.origin.y = 0
        }, completion:
            {_ in view.removeFromSuperview()})
    }
    
    
    func animSp(_l: UIView){
        
        var fast = 0
        if ViewController.diff == "easy"
        {
            fast = BalloonsGame.speed - 1
        }
        else if ViewController.diff == "medium"
        {
            fast = BalloonsGame.speed - 3
        }
        else
        {
            fast = BalloonsGame.speed - 6
        }
        
        UIView.animate(withDuration: TimeInterval(fast), delay: 0, options: .allowUserInteraction, animations: {
            _l.frame.origin.y = 0
        }, completion:
            {_ in _l.removeFromSuperview()})
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let t = touches.first
        let tLoc = t!.location(in: self.view)
        
        popper.prepareToPlay()
        
        
        
        for i in 2...self.view.subviews.count {
            
            
            if self.view.subviews[i-1].layer.presentation()!.hitTest(tLoc) != nil {
                
                
                if self.view.subviews[i-1].tag < 10
                {
                    scTotal += self.view.subviews[i-1].tag
                    
                    
                    
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

                
                    
                loser = 10
                self.view.subviews[i-1].alpha = 0
                popper.play()
                }
                else if self.view.subviews[i-1].tag == 11
                {
                    BalloonsGame.speed = BalloonsGame.speed + 5
                    loser = 10
                    self.view.subviews[i-1].alpha = 0
                    
                    let play = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(cont), userInfo: nil, repeats: false)
                    popper.play()
                }
                    
                else if self.view.subviews[i-1].tag == 12
                {
                    self.view.subviews[i-1].alpha = 0
                    lose()
                    popper.play()
                }
        
            }
        }
      }
}

