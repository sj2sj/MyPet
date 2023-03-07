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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //펫 이미지, 이름 초기 설정
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.basic))
    
    petName.text = myPet.name
  }

  
  //밥주기 버튼 클릭
  @IBAction func tappedFoodBtn(_ sender: UIButton) {
    //1. 밥게이지 올려줘야 해요
    

    //2. 밥먹는이미지 출력해줘야해요
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.food))
    
    //3. 러브올려줘야해요
    myPet.plusLove()
  }
  
  
  //놀아주기 버튼 클릭
  @IBAction func tappedPlayBtn(_ sender: UIButton) {
    
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.play))
    
    //3. 러브올려줘야해요.
    myPet.plusLove()
  }
  
  
  
  //씻기 버튼 클릭
  @IBAction func tappedShowerBtn(_ sender: UIButton) {
    
    petImage.image = UIImage(named: myPet.viewImage(Pet.Behavior.shower))
    
    //3. 러브올려줘야해요
    myPet.plusLove()
  }
  

}


