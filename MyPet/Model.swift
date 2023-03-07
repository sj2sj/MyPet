//
//  Model.swift
//  MyPet
//
//  Created by 뜌딩 on 2023/03/01.
//

import Foundation

// 부모 클래스 Pet
class Pet {
  // pet이 행동을 할 때마다 이미지를 변경 시키기 위해
  // pet마다 해당 이미지를 저장하는 딕셔너리
  var petImgDic: [Behavior:String] = [:]
  
  // 변수들 //
  var name: String
  var age: Int
  
  //status 최대치
  final let maxGauge: Int = 100
  
  //포만감, 즐거움, 청결, 애정
  var satiety, pleasure, cleanliness, love: Int
  
  //love가 랜덤으로 오름
  final func plusLove() {
    self.love += Int.random(in: 1...5)
    print("love: \(self.love)")
  }
  
  // 생성자
  init(name: String, age: Int, satiety: Int, pleasure: Int, cleanliness: Int, love: Int) {
    self.name = name
    self.age = age
    self.satiety = satiety
    self.pleasure = pleasure
    self.cleanliness = cleanliness
    self.love = love
  }
  
  // 편의 -> 지정
  convenience init() {
    self.init(name: "", age: 1, satiety: 50, pleasure: 50, cleanliness: 50, love: 0)
  }
  
}



//고양이
class Cat: Pet {
  init() {
    super.init(name: "고양이", age: 1, satiety: 50, pleasure: 50, cleanliness: 50, love: 0)
    petImgDic = [Behavior.basic : "cat.png"
                 , Behavior.food : "cat_food.png"
                 , Behavior.shower : "cat_shower.png"
                 , Behavior.play : "cat_play.png"]
  }
}


//강아지
class Dog: Pet {
  init() {
    super.init(name: "강아지", age: 1, satiety: 50, pleasure: 50, cleanliness: 50, love: 0)
    petImgDic = [Behavior.basic : "dog.png"
                 , Behavior.food : "dog_food.png"
                 , Behavior.shower : "dog_shower.png"
                 , Behavior.play: "dog_play.png"]
  }
}


//새
class Bird: Pet {
  init() {
    super.init(name: "새", age: 1, satiety: 50, pleasure: 50, cleanliness: 50, love: 0)
    petImgDic = [Behavior.basic : "bird.png"
                 , Behavior.food : "bird_food.png"
                 , Behavior.shower : "bird.png"]
  }
}



//Pet 확장
extension Pet {
  enum Behavior: String {
    case basic = "basic"
    case food = "food"
    case shower = "shower"
    case play = "play"
  }
  
  // 행동에 맞는 이미지 출력해줌
  func viewImage(_ behavior: Behavior) -> String {
    guard let imageName = self.petImgDic[behavior] else { return "" }
    //print(result)
    
    return imageName
  }
}

