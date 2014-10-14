//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Rizwan Javaid on 10/8/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageVIew: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
   
    
    // Create an empty array
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    
    var currentIndex = 0
    
    // Tuple
    var currentAnimal = (species: "Tiger", index:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        
//        println(myTiger.randomFact())
        
        myTigers.append(myTiger)
        
        
//        println("My Tiger's name is: \(myTiger.name). My Tiger's breed is \(myTiger.breed). My Tiger's age is \(myTiger.age). My Tiger's picture is \(myTiger.image)")
        
        myImageVIew.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indo Chinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.roar()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("LionCub", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }

    func updateView(){
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageVIew.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            
            } else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageVIew.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFacts()
            
            }
            
                self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
                
        })

        
    }

    
    
    
    
    
}









