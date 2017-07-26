


import UIKit
import AVFoundation
class MatchView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var ScoreArr = UserDefaults.standard.array(forKey: "sA") as! [Int]
    var gameArr = UserDefaults.standard.array(forKey: "gA") as! [String]
    var diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]
    
    var collectionView: UICollectionView!
    var medCollectionView: UICollectionView!
    
    
    static var tap = 0
    
    static var imageStored = [String]()
    static var cellStored = [UICollectionViewCell]()
    
    static var totalScore = 0
    
    static var matchCount = 0
    
    static var isTapped = false
    static var totalClicks = 0

        var easyImageArray1 = [ UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "5") ]
        var easyImageArray2 = [ UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "5") ]
    
    static var cellStored1 = UICollectionViewCell()
    static var cellStored2 = UICollectionViewCell()
    
    static var squareOne = CGRect(x: 400, y:200, width: 100, height: 100)
    static var c = UIView(frame: squareOne)
    
  
    static var counter = 120
    static var scoreCounter = 0
    
    static var easyArray = ["1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6" ]
    static var mediumArray = ["1", "2", "3", "4", "5", "6","7", "8", "1", "2", "3", "4", "5", "6", "7", "8" ]
    
    static var hardArray = ["1", "2", "3", "4", "5", "6","7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8" , "9", "10"]
    
    static var randArray = [String]()
    
     static var label = UILabel(frame: CGRect(x: 195, y: 75, width: 200, height: 48))
    
    static var framer = CGRect(x: 195, y: 75, width: 50, height: 48)
    static var minutes = UIView(frame: framer)
    static var framerTen = CGRect(x: 295, y: 75, width: 35, height: 48)
    static var framerColon = CGRect(x: 245, y: 75, width: 40, height: 48)
    static var framerOne = CGRect(x: 330, y: 75, width: 35, height: 48)
    static var tenths = UIView(frame: framerTen)
    static var ones = UIView(frame: framerOne)
    static var colon = UIView(frame: framerColon)
    
    static var scoreLabel = UILabel(frame: CGRect(x: 850, y: 75, width: 200, height: 48))
    
    static var ScoreTenths = UIView(frame: CGRect(x: 850, y: 75, width: 35, height: 48 ))
    static var scoreOnes = UIView(frame: CGRect(x: 885, y: 75, width: 35, height: 48 ))
    
    
    static var TwoMin = Timer()
    
    
    
    
    
       var framer = ChangeImageMtch()
    
    
    var cheers = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        MatchView.matchCount = 0
   
        let time = CGRect(x: 20, y: 75, width: 175, height: 48)
        let timer = UIView(frame: time)
        timer.backgroundColor = UIColor(patternImage: UIImage(named: "time")!).withAlphaComponent(1.0)
        //self.view.addSubview(timer)
        
        let score = CGRect(x: 675, y: 75, width: 175, height: 48)
        let scoree = UIView(frame: score)
        scoree.backgroundColor = UIColor(patternImage: UIImage(named: "score")!).withAlphaComponent(1.0)
        
        //self.view.addSubview(scoree)
        
        
        if ViewController.diff == "easy" {
        
            MatchView.counter = 120}
        
        if ViewController.diff == "medium" {
        
            MatchView.counter = 90
        }
        
        if ViewController.diff == "hard" {
            MatchView.counter = 60
        
        
        }
        
        
        MatchView.scoreCounter = 0
        MatchView.totalScore = 0
        
        MatchView.TwoMin.invalidate()
        MatchView.TwoMin = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector (timeCountDown), userInfo: nil, repeats: true)
        
//       let ScoreTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector (scorer), userInfo: nil, repeats: true)
        //label.center = CGPoint(x: 160, y: 285)
        MatchView.label.textAlignment = .center
       // MatchView.label.font = UIFont(name: "Avenir-Light", size: 18.0)
       // MatchView.label.text = "2.00"
        MatchView.label.backgroundColor = UIColor.blue
        MatchView.label.textColor = UIColor.white
        
        MatchView.scoreLabel.textAlignment = .center
        MatchView.scoreLabel.text = "\(MatchView.totalScore)"
       
       // self.view.addSubview(label)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        var rectangle = CGRect(x: 300, y: 200, width: 500, height: 600)
//        var smallView = UIView(frame: rectangle)
//        view.addSubview(smallView)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        if ViewController.diff == "easy" {
            layout.sectionInset = UIEdgeInsets(top: 200, left: 300, bottom: 300, right: 300)}
        
        if ViewController.diff == "medium" {
            layout.sectionInset = UIEdgeInsets(top: 200, left: 250, bottom: 300, right: 250)
        
        }
        
        if ViewController.diff == "hard" {
            layout.sectionInset = UIEdgeInsets(top: 200, left: 200, bottom: 300, right: 200)
            
        }
        
        MatchView.minutes.backgroundColor = UIColor.blue
        MatchView.tenths.backgroundColor = UIColor.blue
        MatchView.colon.backgroundColor = UIColor(patternImage: UIImage(named: "colon")!).withAlphaComponent(1.0)
        MatchView.ones.backgroundColor = UIColor.blue
        
        MatchView.ScoreTenths.backgroundColor = UIColor.blue
        MatchView.scoreOnes.backgroundColor = UIColor.blue
        
        
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.black
        self.view.addSubview(collectionView)
        collectionView.addSubview(timer)
        collectionView.addSubview(scoree)
        //collectionView.addSubview(MatchView.label)
        collectionView.addSubview(MatchView.minutes)
        collectionView.addSubview(MatchView.tenths)
        collectionView.addSubview(MatchView.colon)
        collectionView.addSubview(MatchView.ones)
        
        //collectionView.addSubview(MatchView.scoreLabel)
        collectionView.addSubview(MatchView.ScoreTenths)
        collectionView.addSubview(MatchView.scoreOnes)
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundMatch")!).withAlphaComponent(1.0)
    
        
        MatchView.imageStored = [String]()
        MatchView.cellStored = [UICollectionViewCell]()
        
        
        MatchView.easyArray = ["1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6" ]
        MatchView.mediumArray = ["1", "2", "3", "4", "5", "6","7", "8", "1", "2", "3", "4", "5", "6", "7", "8" ]
        MatchView.hardArray = ["1", "2", "3", "4", "5", "6","7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8" , "9", "10"]
        MatchView.randArray = [String]()
        //print(MatchView.easyArray)
       
        
        
        
        if ViewController.diff == "easy" {
        while MatchView.easyArray.count != 0 {
            var counter = UInt32(MatchView.easyArray.count)
            var x = arc4random() % counter
            var y = Int(x)
            
            MatchView.randArray.append(MatchView.easyArray[y])
            MatchView.easyArray.remove(at: y)
        }
        
        
        
        }
        
        
        if ViewController.diff == "medium" {
            while MatchView.mediumArray.count != 0 {
                var counter = UInt32(MatchView.mediumArray.count)
                var x = arc4random() % counter
                var y = Int(x)
                
                MatchView.randArray.append(MatchView.mediumArray[y])
                MatchView.mediumArray.remove(at: y)
            }
            
            
            
        }
    
        if ViewController.diff == "hard" {
            while MatchView.hardArray.count != 0 {
                var counter = UInt32(MatchView.hardArray.count)
                var x = arc4random() % counter
                var y = Int(x)
                
                MatchView.randArray.append(MatchView.hardArray[y])
                MatchView.hardArray.remove(at: y)
            }
            
            
            
        }
    
    
    
    
    }
       
        
        
  
   
    
    


    
   

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if ViewController.diff == "easy" {
            return 12} else if ViewController.diff == "medium" {
            return 16
        } else { return 20}
        
        
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
    cell.backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
    return cell
}

   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell:UICollectionViewCell = self.collectionView.cellForItem(at: indexPath)!
        
        
        var word = String(MatchView.randArray[indexPath.row])
        
        cell.backgroundColor =  UIColor(patternImage: UIImage(named: word!)!).withAlphaComponent(1.0)
        
        
        
        
        
          MatchView.imageStored.append(word!)
          MatchView.cellStored.append(cell)
    
        
        print(MatchView.cellStored.count)
        
        if MatchView.imageStored.count == 2 {
            if MatchView.imageStored[0] == MatchView.imageStored[1] {
                print("match")
                
                
                let audioPath = Bundle.main.path(forResource: "cheer", ofType: "mp3")
                
                do{
                    cheers = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                }
                catch{
                    print("error")
                }
                

                cheers.prepareToPlay()
                cheers.play()
                
                
                
                
                
//                let scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(scorer), userInfo: nil, repeats: false)
                
                print(MatchView.scoreCounter)
                print(MatchView.totalScore)
                if MatchView.scoreCounter <= 3 {
                    MatchView.totalScore+=5
                    MatchView.scoreLabel.text = "\(MatchView.totalScore) "
                }
                if MatchView.scoreCounter > 3 && MatchView.scoreCounter <= 7 {
                    MatchView.totalScore+=4
                     MatchView.scoreLabel.text = "\(MatchView.totalScore) "
                }
                if MatchView.scoreCounter > 7 {
                    MatchView.totalScore+=3
                     MatchView.scoreLabel.text = "\(MatchView.totalScore) "
                
                }
                
                
                
                var tenth = MatchView.totalScore / 10
                var one = MatchView.totalScore % 10
                
                switchPic(ten: tenth, one: one)
                
                
                
                cell.isUserInteractionEnabled = false
                 MatchView.imageStored.removeAll()
                MatchView.cellStored.removeAll()
                MatchView.scoreCounter = 0
                MatchView.matchCount+=1
                
                print(MatchView.matchCount)
                
                if MatchView.matchCount == 6 && ViewController.diff == "easy" {
                 
                
                    MatchView.TwoMin.invalidate()
                    setScores(sc: MatchView.totalScore, game: "Match", difficulty: ViewController.diff)
                    
                    let wonGame = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    wonGame.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.viewDidLoad()
                        
                    }))
                    //
                    wonGame.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.navigationController?.popToRootViewController(animated: true)
                        
                   
                    }))

                     self.present(wonGame, animated: true, completion: nil)
                    
                    MatchView.matchCount = 0
                
                }
                
                if MatchView.matchCount == 8 && ViewController.diff == "medium" {
                    MatchView.TwoMin.invalidate()
                    setScores(sc: MatchView.totalScore, game: "Match", difficulty: ViewController.diff)
                    
                    let wonGame = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    wonGame.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.viewDidLoad()
                        
                    }))
                    //
                    wonGame.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.navigationController?.popToRootViewController(animated: true)
                        
                        
                    }))
                    
                    self.present(wonGame, animated: true, completion: nil)
                    
                    MatchView.matchCount = 0

                
                
                }
                
                
                
                if MatchView.matchCount == 10 && ViewController.diff == "hard" {
                    MatchView.TwoMin.invalidate()
                    setScores(sc: MatchView.totalScore, game: "Match", difficulty: ViewController.diff)
                    
                    
                    let wonGame = UIAlertController(title: "You won!", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    wonGame.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.viewDidLoad()
                        
                    }))
                    //
                    wonGame.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in wonGame.dismiss(animated: true, completion: nil)
                        
                        self.navigationController?.popToRootViewController(animated: true)
                        
                        
                    }))
                    
                    self.present(wonGame, animated: true, completion: nil)
                    
                    MatchView.matchCount = 0
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                // MatchView.scoreLabel.text = "\(MatchView.totalScore) "
          //  print(MatchView.totalScore)
            } else { print("not a match")
               
                
                MatchView.cellStored1 = MatchView.cellStored[0]
                MatchView.cellStored2 = MatchView.cellStored[1]
                
                MatchView.imageStored.removeAll()
                MatchView.cellStored.removeAll()
                let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(back_to_question), userInfo: nil, repeats: false)
      
                
                
                
//                MatchView.cellStored[0].backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
//                MatchView.cellStored[1].backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
//                  MatchView.imageStored.removeAll()
//                MatchView.cellStored.removeAll()
                
//                cell.backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
            }
            
        
        
        }
        
        
        
        
        
        
      
        //print(MatchView.imageStored)
    

    }
    
    
    
    
    
    func back_to_question() {
//        MatchView.cellStored[0].backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
//        MatchView.cellStored[1].backgroundColor = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
        
        MatchView.cellStored1.backgroundColor  = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
         MatchView.cellStored2.backgroundColor  = UIColor(patternImage: UIImage(named: "question")!).withAlphaComponent(1.0)
//        MatchView.imageStored.removeAll()
//        MatchView.cellStored.removeAll()

    
    
    }
    
    func scorer()  {
    
     //  MatchView.scoreCounter+=1
        
        
    
    }
    
    func timeCountDown() {
    
        
        MatchView.counter-=1
        
        
        var min = MatchView.counter / 60
        
        var second = MatchView.counter % 60
        var tenths = second / 10
        var ones = second % 10
        
        
        if min == 1 {
            MatchView.minutes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        
        if min == 0 {
            MatchView.minutes.backgroundColor = UIColor.blue
        }

        
        
        if tenths == 5 {
            MatchView.tenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        
        if tenths == 4 {
            MatchView.tenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        
        
        if tenths == 3 {
            MatchView.tenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        
        
        if tenths == 2 {
            MatchView.tenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        
        if tenths == 1 {
            MatchView.tenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        
        if tenths == 0 {
            MatchView.tenths.backgroundColor = UIColor.blue
        }
        
        if ones == 9 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        
        if ones == 8 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        
        
        if ones == 7 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        
        
        if ones == 6 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }

        
        if ones == 5 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        
        if ones == 4 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        
        
        if ones == 3 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        
        
        if ones == 2 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        
        if ones == 1 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        
        if ones == 0 {
            MatchView.ones.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }

        
        
        
        
        
        
        
        
        
        
        
        MatchView.label.text = "\(min): \(tenths)\(ones)"
         MatchView.scoreCounter+=1
    
        
        if MatchView.counter == 0 {
           
            MatchView.TwoMin.invalidate()
        //alert goes here -> lose game  
            
            
            print("reached")
            let timeUp = UIAlertController(title: "Game Over", message: "You lost :(", preferredStyle: UIAlertControllerStyle.alert)
            
            timeUp.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action) in timeUp.dismiss(animated: true, completion: nil)
                
               self.viewDidLoad()
                
            }))
//
            timeUp.addAction(UIAlertAction(title: "Go Home", style: UIAlertActionStyle.default, handler: { (action) in timeUp.dismiss(animated: true, completion: nil)
                
              //   self.performSegue(withIdentifier: "goHome", sender: self)
              
            self.navigationController?.popToRootViewController(animated: true)
               
              
                                 
            }))
            
            
            self.present(timeUp, animated: true, completion: nil)
            
           //  MatchView.totalScore = 0
          // viewDidLoad()
        
        }
        
    }
    
    
    func switchPic(ten: Int, one: Int) {
        if ten == 9 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        
        if ten == 8 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        
        
        if ten == 7 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        
        
        if ten == 6 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        
        if ten == 5 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        
        if ten == 4 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        
        
        if ten == 3 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        
        
        if ten == 2 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        
        if ten == 1 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        
        if ten == 0 {
            MatchView.ScoreTenths.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }

        if one == 9 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-9")!).withAlphaComponent(1.0)
        }
        
        if one == 8 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-8")!).withAlphaComponent(1.0)
        }
        
        
        if one == 7 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-7")!).withAlphaComponent(1.0)
        }
        
        
        if one == 6 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-6")!).withAlphaComponent(1.0)
        }
        
        
        if one == 5 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-5")!).withAlphaComponent(1.0)
        }
        
        if one == 4 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-4")!).withAlphaComponent(1.0)
        }
        
        
        if one == 3 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-3")!).withAlphaComponent(1.0)
        }
        
        
        if one == 2 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-2")!).withAlphaComponent(1.0)
        }
        
        if one == 1 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-1")!).withAlphaComponent(1.0)
        }
        
        if one == 0 {
            MatchView.scoreOnes.backgroundColor = UIColor(patternImage: UIImage(named: "cartoon-number-0")!).withAlphaComponent(1.0)
        }

    
    
    
    
    
    
    
    
    
    
    }
    
    func setScores(sc: Int, game: String, difficulty: String)
    {
        ScoreArr = UserDefaults.standard.array(forKey: "sA") as! [Int]
        gameArr = UserDefaults.standard.array(forKey: "gA") as! [String]
        diffArr = UserDefaults.standard.array(forKey: "dA") as! [String]
        
        if sc > ScoreArr[4]
        {
            for i in 0...3
            {
                ScoreArr[i] = ScoreArr[i+1]
                gameArr[i] = gameArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[4] = sc
            gameArr[4] = game
            diffArr[4] = difficulty
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[3]
        {
            for i in 0...2
            {
                ScoreArr[i] = ScoreArr[i+1]
                gameArr[i] = gameArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[3] = sc
            gameArr[3] = game
            diffArr[3] = difficulty
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[2]
        {
            for i in 0...1
            {
                ScoreArr[i] = ScoreArr[i+1]
                gameArr[i] = gameArr[i+1]
                diffArr[i] = diffArr[i+1]
            }
            ScoreArr[2] = sc
            gameArr[2] = game
            diffArr[2] = difficulty
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[1]
        {
            
            ScoreArr[0] = ScoreArr[1]
            gameArr[0] = gameArr[1]
            diffArr[0] = diffArr[1]
            ScoreArr[1] = sc
            gameArr[1] = game
            diffArr[1] = difficulty
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
            
        else if sc > ScoreArr[0]
        {
            ScoreArr[0] = sc
            gameArr[0] = game
            diffArr[0] = difficulty
            UserDefaults.standard.set(ScoreArr, forKey: "sA")
            UserDefaults.standard.set(gameArr, forKey: "gA")
            UserDefaults.standard.set(diffArr, forKey: "dA")
        }
       
    }
    
    
    
    func randomize(Array1: [String], Array2: [String]) -> [String] {
        var Array1 = Array1
        var Array2 = Array2
        var counter = UInt32(Array1.count)
        var x = arc4random() % counter
        var y = Int(x)
        
        Array2.append(Array1[y])
        Array1.remove(at: y)
        return Array2
    
    
    }
    
    
    
}



