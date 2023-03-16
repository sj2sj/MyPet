//
//  PetViewController.swift
//  MyPet
//
//  Created by 뜌딩 on 2023/03/01.
//

import UIKit

class PetViewController: UIViewController {
  
  var myPet: Pet = Pet()
  
  @IBOutlet weak var petImage: UIImageView!
  @IBOutlet weak var petName: UILabel!
  @IBOutlet weak var petLoveStatus: UILabel!
  @IBOutlet weak var specialBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //펫 이미지, 이름 초기 설정
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.basic))
    
    petName.text = myPet.name
    
    specialBtn.layer.cornerRadius = specialBtn.layer.frame.size.width / 2
  }

  
  //밥주기 버튼 클릭
  @IBAction func tappedFoodBtn(_ sender: UIButton) {
    //1. satiety 올려줌
    guard var satiety = myPet.status["satiety"] else { return }
    satiety += Int.random(in: 5...10)
    myPet.status["satiety"] = satiety

    //2. 밥먹는이미지 출력해줘야해요
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.food))
    
   
  }
  
  
  //놀아주기 버튼 클릭
  @IBAction func tappedPlayBtn(_ sender: UIButton) {
    //pleasure
    guard var pleasure = myPet.status["pleasure"] else { return }
    pleasure += Int.random(in: 5...10)
    myPet.status["pleasure"] = pleasure
    
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.play))

  }
  
  
  
  //씻기 버튼 클릭
  @IBAction func tappedShowerBtn(_ sender: UIButton) {
    //cleanliness
    guard var cleanliness = myPet.status["cleanliness"] else { return }
    cleanliness += Int.random(in: 5...10)
    myPet.status["cleanliness"] = cleanliness
    
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.shower))
    
  }
  
  
  // 밥주기, 놀아주기, 씻기 버튼 클릭 시 공통
  @IBAction func tappedBehaviorBtn(_ sender: UIButton) {
    //각 버튼 클릭 시 +love
    myPet.plusLove()
    petLoveStatus.text = String(myPet.love)
  }
  
  
  // 상태보기 버튼
  @IBAction func tappedStatusBtn(_ sender: UIButton) {
    let statusSum = myPet.status.values.reduce(0) { $0 + $1 }
    print(myPet.status)
    print("status 총합: \(statusSum)")
  }
  
  
  // 특수행동 버튼
  @IBAction func tappedSpecialBtn(_ sender: UIButton) {

    if (myPet is Flyable) {
      (myPet as! Bird).fly()
    } else {
      print("특수행동 없음")
    }
  }
  
}


