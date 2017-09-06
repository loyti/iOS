import UIKit

class Animal {
    
    var name: String
    var health: Int = 100
    
    init(name: String){
        self.name = name
    }
    
    func aHealth(){
        print("The health of the \(self.name) is \(self.health)")
    }
    
}

class Cat: Animal {
    
    init(catName: String){
        super.init(name: catName)
        self.health = 150
    }
    
    func growl(){
        print("Meow")
    }
    
    func hunting(){
        if self.health > 0 {
            self.health -= 10
            print("Running takes 10 health. Only \(self.health) remains")
        } else {
            print("You have no energy to hunt. Try sleeping instead")
        }
}

class Lion: Cat {
    
    init(lionName: String){
        super.init(catName: lionName)
        self.health = 200
    }
    
    override func growl() {
        print("ROAR!!! From the King of the Jungle")
    }
    
    func sleep(){
        print("Sleeping restores 50 health")
        self.health += 50
    }
}

class Cheetah: Cat {
    
    init(cheetahName: String){
        super.init(catName: cheetahName)
        self.health = 200
    }
    
    override func hunting(){
        if self.health > 0 {
            self.health -= 50
            print("Running takes 50 health. Only \(self.health) remains")
        } else {
            print("You have no energy to hunt. Try sleeping instead")
        }
        
    }
    
    func sleep(){
        if self.health > 200 {
            print("You have slept enough. Time to go hunting")
        } else {
            print("Sleeping restores 50 health")
            self.health += 50
        }
    }
}

