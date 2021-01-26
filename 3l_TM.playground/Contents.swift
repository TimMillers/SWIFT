import UIKit

var str = "Hello, playground"

enum engineState: String {
    case on = "Engine on"
    case off = "Engine off"
}

enum windowState: String {
    case open = "Windows open"
    case close = "Windows close"
}

enum actions: String {
    case move = "Go"
    case stop = "Stop"
    case openWindow = "Please open window!"
    case closeWindow = "Please close window!"
    case putLuggage = "Put things in the luggage!"
    case getLuggage = "Get things out of luggage!"
}

struct Vehicle {
    let brand: String
    let releaseYear: UInt
    
    lazy var isMyVihicleOld: Bool = {
        return (2021 - releaseYear) > 20
    }()
    
    var engineState: engineState {
        didSet{
            print(engineState.rawValue)
        }
    }
    
    public var windowState: windowState {
        didSet{
            print(windowState.rawValue)
        }
    }
    
    private let vehicleVolume: UInt  // maximum
    private var vehicleFullness: UInt {
        didSet{
            if(vehicleFullness <= vehicleVolume) {
                print("The luggage full is \(vehicleFullnessLevel) %")
            } else {
                vehicleFullness = oldValue
                print("No space in luggage, \(oldValue)")
            }
            
        }
    }
    
    private var vehicleFullnessLevel: UInt {
        get{
            return vehicleFullness*100/vehicleVolume
        }
        set(newValueFullness){
            vehicleFullness = vehicleVolume * newValueFullness/100
        }
    }
    init(brand: String, releaseYear: UInt, vehicleVolume: UInt) {
        self.brand = brand
        self.releaseYear = releaseYear
        self.vehicleVolume = vehicleVolume
        self.engineState = .off
        self.windowState = .close
        self.vehicleFullness = 0
    }
    
    private mutating func updateVehicleFullfines(luggage: UInt){
        self.vehicleFullness = luggage
    }
    private mutating func updateVehicleFullfines(percent: UInt){
        self.vehicleFullnessLevel = percent
    }
    mutating public func action(type: actions, luggage: UInt = 0, FullnessPercent: UInt = 0){
        switch type {
        
        case .move:
            print(actions.move.rawValue)
            self.engineState = .on
        case .stop:
            print(actions.stop.rawValue)
            self.engineState = .off
        case .openWindow:
            print(actions.openWindow.rawValue)
            self.windowState = .close
        case .closeWindow:
            print(actions.closeWindow.rawValue)
            self.windowState = .close
        case .putLuggage where luggage > 0:
            print(actions.putLuggage.rawValue)
            updateVehicleFullfines(luggage: luggage)
        case .putLuggage where FullnessPercent > 0:
            print(actions.putLuggage.rawValue)
            updateVehicleFullfines(percent: FullnessPercent)
        case .getLuggage:
            print(actions.getLuggage.rawValue)
            updateVehicleFullfines(luggage: 0)
            
        default:
            print("error data!")
            
        }
    }
    mutating func printInfo(){
        print("-------------------")
        print("Brand: \(brand)")
        print("Year: \(releaseYear)")
        print("luggage: \(vehicleVolume)kg")
        print("Engine: \(engineState.rawValue)")
        print("Window: \(windowState.rawValue)")
        print("luggage full is: \(vehicleFullnessLevel)")
        print("-------------------")
    }
    
}

var lada = Vehicle(brand: "lada", releaseYear: 2010, vehicleVolume: 50)
lada.printInfo()

lada.action(type: .putLuggage, luggage: 20)
lada.action(type: .move)
lada.action(type: .closeWindow)
lada.action(type: .openWindow)
lada.action(type: .getLuggage)
lada.action(type: .putLuggage)
lada.printInfo()
print("Old car?", lada.isMyVihicleOld)

var maz = Vehicle(brand: "maz", releaseYear: 2010, vehicleVolume: 50)
lada.printInfo()

maz.action(type: .putLuggage, luggage: 20)
maz.action(type: .move)
maz.action(type: .closeWindow)
maz.action(type: .openWindow)
maz.action(type: .getLuggage)
maz.action(type: .putLuggage)
maz.printInfo()
print("Old car?", maz.isMyVihicleOld)




