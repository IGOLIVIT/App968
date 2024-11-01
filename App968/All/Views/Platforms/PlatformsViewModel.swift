//
//  PlatformsViewModel.swift
//  App968
//
//  Created by IGOR on 29/10/2024.
//

import SwiftUI
import CoreData

final class PlatformsViewModel: ObservableObject {
    
    @Published var curPhotos: [String] = ["glmr", "grt", "hbar", "hnt", "hot", "ht", "icp", "xrp", "icx", "iotx", "kava", "kcs", "kda", "klay", "knc", "ksm", "leo", "link", "xtz", "lrc", "ltc", "lunav", "mana", "matic", "mina", "miota", "mkr"]
    @Published var currentPhoto: String = ""
    
    @Published var invTypes: [String] = ["Active", "Completed", "Canceled"]
    @Published var currentInvType: String = ""
    @Published var currentInvTypeForFilter: String = "Active"

    @Published var currentCryptoTypeForFilter: String = "All"
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddCurr: Bool = false
    @Published var isCryptoCur: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDollar: Bool = false
    @Published var isAddPlatform: Bool = false
    @Published var isPlatForAdd: Bool = false
    @Published var isAddInvestments: Bool = false
    
    @AppStorage("summa") var summa: Int = 0
    @AppStorage("summa2") var summa2: Int = 0
    @AppStorage("summa3") var summa3: Int = 0
    
    @AppStorage("DollarExchange") var DollarExchange: String = ""
    @Published var addExchange: String = ""
    
    @Published var cryptoForPlatform: String = ""
    @Published var currentsPlatForAdd: String = ""

    @Published var crPhoto: String = ""
    @Published var crName: String = ""
    @Published var crEx: String = ""
    @Published var crWell: String = ""

    @Published var cryptos: [CrypModel] = []
    @Published var selectedCryp: CrypModel?

    func addCryp() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CrypModel", into: context) as! CrypModel

        loan.crPhoto = crPhoto
        loan.crName = crName
        loan.crEx = crEx
        loan.crWell = crWell

        CoreDataStack.shared.saveContext()
    }

    func fetchCryps() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CrypModel>(entityName: "CrypModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.cryptos = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.cryptos = []
        }
    }
    
    @Published var plNewName: String = ""

    @Published var plName: String = ""
    @Published var plLink: String = ""
    @Published var plCC: String = ""

    @Published var platforms: [PlatModel] = []
    @Published var selectedPlatform: PlatModel?

    func addPlatform() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlatModel", into: context) as! PlatModel

        loan.plName = plName
        loan.plLink = plLink
        loan.plCC = plCC

        CoreDataStack.shared.saveContext()
    }

    func fetchPlatforms() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlatModel>(entityName: "PlatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.platforms = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.platforms = []
        }
    }
    
    @Published var inPlat: String = ""
    @Published var inDate: Date = Date()
    @Published var inType: String = ""

    @Published var investments: [InvestModel] = []
    @Published var selectedInv: InvestModel?

    func addInv() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InvestModel", into: context) as! InvestModel

        loan.inPlat = inPlat
        loan.inDate = inDate
        loan.inType = inType

        CoreDataStack.shared.saveContext()
    }

    func fetchInvs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InvestModel>(entityName: "InvestModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.investments = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.investments = []
        }
    }
}
