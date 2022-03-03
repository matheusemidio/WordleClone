//
//  ViewController.swift
//  WordyApp
//
//  Created by Matheus Cadena on 2022-02-16.
//
import Foundation
import UIKit



class ViewController: UIViewController {
    
    //Declaration of variables
    public var responseGlobal : [String]?
    public var wordy : String?
    private var rowA = [UILabel]()
    private var rowB = [UILabel]()
    private var rowC = [UILabel]()
    private var rowD = [UILabel]()
    private var rowE = [UILabel]()
    private var rowF = [UILabel]()
    private var rowG = [UILabel]()
    private var grid = [[UILabel]]()
    private var guessUsedButtons = [UIButton]()
    private var gridRowNumber = 0
    private var gridCollumnNumber = 0

    //Declaration of outlets
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var charA1: UILabel!
    @IBOutlet weak var charA2: UILabel!
    @IBOutlet weak var charA3: UILabel!
    @IBOutlet weak var charA4: UILabel!
    @IBOutlet weak var charA5: UILabel!

    
    @IBOutlet weak var charB1: UILabel!
    @IBOutlet weak var charB2: UILabel!
    @IBOutlet weak var charB3: UILabel!
    @IBOutlet weak var charB4: UILabel!
    @IBOutlet weak var charB5: UILabel!
    
    @IBOutlet weak var charC1: UILabel!
    @IBOutlet weak var charC2: UILabel!
    @IBOutlet weak var charC3: UILabel!
    @IBOutlet weak var charC4: UILabel!
    @IBOutlet weak var charC5: UILabel!

    @IBOutlet weak var charD1: UILabel!
    @IBOutlet weak var charD2: UILabel!
    @IBOutlet weak var charD3: UILabel!
    @IBOutlet weak var charD4: UILabel!
    @IBOutlet weak var charD5: UILabel!
    
    @IBOutlet weak var charE1: UILabel!
    @IBOutlet weak var charE2: UILabel!
    @IBOutlet weak var charE3: UILabel!
    @IBOutlet weak var charE4: UILabel!
    @IBOutlet weak var charE5: UILabel!
    
    @IBOutlet weak var charF1: UILabel!
    @IBOutlet weak var charF2: UILabel!
    @IBOutlet weak var charF3: UILabel!
    @IBOutlet weak var charF4: UILabel!
    @IBOutlet weak var charF5: UILabel!
    
    @IBOutlet weak var charG1: UILabel!
    @IBOutlet weak var charG2: UILabel!
    @IBOutlet weak var charG3: UILabel!
    @IBOutlet weak var charG4: UILabel!
    @IBOutlet weak var charG5: UILabel!
    
    
    @IBOutlet weak var letterA: UIButton!
    @IBOutlet weak var letterB: UIButton!
    @IBOutlet weak var letterC: UIButton!
    @IBOutlet weak var letterD: UIButton!
    @IBOutlet weak var letterE: UIButton!
    @IBOutlet weak var letterF: UIButton!
    @IBOutlet weak var letterG: UIButton!
    @IBOutlet weak var letterH: UIButton!
    @IBOutlet weak var letterI: UIButton!
    @IBOutlet weak var letterJ: UIButton!
    @IBOutlet weak var letterK: UIButton!
    @IBOutlet weak var letterL: UIButton!
    @IBOutlet weak var letterM: UIButton!
    @IBOutlet weak var letterN: UIButton!
    @IBOutlet weak var letterO: UIButton!
    @IBOutlet weak var letterP: UIButton!
    @IBOutlet weak var letterQ: UIButton!
    @IBOutlet weak var letterR: UIButton!
    @IBOutlet weak var letterS: UIButton!
    @IBOutlet weak var letterT: UIButton!
    @IBOutlet weak var letterU: UIButton!
    @IBOutlet weak var letterV: UIButton!
    @IBOutlet weak var letterX: UIButton!
    @IBOutlet weak var letterW: UIButton!
    @IBOutlet weak var letterY: UIButton!
    @IBOutlet weak var letterZ: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rowA.append(charA1)
        rowA.append(charA2)
        rowA.append(charA3)
        rowA.append(charA4)
        rowA.append(charA5)
        
        rowB.append(charB1)
        rowB.append(charB2)
        rowB.append(charB3)
        rowB.append(charB4)
        rowB.append(charB5)
        
        rowC.append(charC1)
        rowC.append(charC2)
        rowC.append(charC3)
        rowC.append(charC4)
        rowC.append(charC5)
        
        rowD.append(charD1)
        rowD.append(charD2)
        rowD.append(charD3)
        rowD.append(charD4)
        rowD.append(charD5)
        
        rowE.append(charE1)
        rowE.append(charE2)
        rowE.append(charE3)
        rowE.append(charE4)
        rowE.append(charE5)
        
        rowF.append(charF1)
        rowF.append(charF2)
        rowF.append(charF3)
        rowF.append(charG4)
        rowF.append(charG5)
        
        grid.append(rowA)
        grid.append(rowB)
        grid.append(rowC)
        grid.append(rowD)
        grid.append(rowE)
        grid.append(rowF)
        grid.append(rowG)


        
        apiCallRandomWord()
                
    }

    func apiCallRandomWord()
    {
        //This function will call the api and get a 20 words array of random words as a response
        
        //let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(wordInput)")!
        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=20&swear=0")!
        //let url = URL(string: "https://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
        URLSession.shared.fetchDataRandomWord(at: url) { result in
          switch result {
          case .success(let words):
              print("\nThe Array of words as a response is \(words)")
              self.responseGlobal = words
              self.pickWord(array: self.responseGlobal!)
              
          case .failure(let error):
              print(error)
          }
        }
        
   
//        let url = URL(string: "http://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
//        URLSession.shared.fetchData(at: url) { result in
//          switch result {
//          case .success(let apiResponse):
//              print("\nThe word is \(apiResponse)")
//              //self.responseGlobal = word[0].word
//          case .failure(let error):
//              print(error)
//          }
//        }
    }
    
    func apiCallDictionary(guess : String)
    {
        
        let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(guess.lowercased())")!
        //let url = URL(string: "https://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
        URLSession.shared.fetchDataDictionary(at: url) { [self] result in
          switch result {
          case .success(let words):
              print("\nThe response of the dictionary call is \(words)")
              //self.responseGlobal = words
              //self.pickWord(array: self.responseGlobal!)
              self.checkGuess(dictionaryResponse: true)

              
          case .failure(let error):
              print(error)
              self.checkGuess(dictionaryResponse: false)
          }
        }
        
    }
    
    func checkGuess(dictionaryResponse : Bool)
    {
        if(dictionaryResponse)
        {
            //If it returns true, the guess was a valid word
            gridCollumnNumber = 0
            gridRowNumber += 1
            
        }
        else
        {
            DispatchQueue.main.async
            {
                Dialog.ok(view: self, title: "Invalid word", message: "The word entered does not exist in the English dictionary.")
                self.gridCollumnNumber = 0
                self.grid[self.gridRowNumber][0].text = ""
                self.grid[self.gridRowNumber][1].text = ""
                self.grid[self.gridRowNumber][2].text = ""
                self.grid[self.gridRowNumber][3].text = ""
                self.grid[self.gridRowNumber][4].text = ""
            }
          
        }
    }
    
    func pickWord(array : [String])
    {
        //This function will iterate through the array of random words and pick one that has 5 chars length
        
        var condition : Bool = false
        for element in array{
            if(element.count == 5){
                self.wordy = element
                print("\nThe wordy is \(self.wordy!)\n")
                condition = true
                break
            }
        }
        if(condition == false)
        {
            apiCallRandomWord()
        }
    }

    
    @IBAction func btnSubmitTouchUp(_ sender: Any) {
        var wordGuess : String = ""
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            //Word is finished
            if(gridCollumnNumber >= 4)
            {
                //Check if guess is correct and if wrong, go to next row
                wordGuess += grid[gridRowNumber][0].text!
                wordGuess += grid[gridRowNumber][1].text!
                wordGuess += grid[gridRowNumber][2].text!
                wordGuess += grid[gridRowNumber][3].text!
                wordGuess += grid[gridRowNumber][4].text!
                
                
                //Check if this word exists on API dictionary
                lblTest.text = wordGuess
                
                //Check guess
                
                apiCallDictionary(guess: wordGuess)

                
            }
            
        }
    }
    
    @IBAction func btnDeleteTouchUp(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            //Word is finished
            if(gridCollumnNumber >= 0)
            {
                grid[gridRowNumber][gridCollumnNumber].text = ""
                guessUsedButtons.popLast()
                if(gridCollumnNumber != 0)
                {
                    gridCollumnNumber -= 1
                }
            }
            
        }
    }
    
    
    @IBAction func btnA(_ sender: Any) {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "A"
                guessUsedButtons.append(letterA)
                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
                
            }
            
        }
    }
    @IBAction func btnB(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "B"
                guessUsedButtons.append(letterB)
                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnC(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "C"
                guessUsedButtons.append(letterC)
                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnD(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "D"
                guessUsedButtons.append(letterD)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnE(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "E"
                guessUsedButtons.append(letterE)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnF(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "F"
                guessUsedButtons.append(letterF)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnG(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "G"
                guessUsedButtons.append(letterG)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnH(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "H"
                guessUsedButtons.append(letterH)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnI(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "I"
                guessUsedButtons.append(letterI)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnJ(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "J"
                guessUsedButtons.append(letterJ)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnK(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "K"
                guessUsedButtons.append(letterK)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnL(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "L"
                guessUsedButtons.append(letterL)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnM(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "M"
                guessUsedButtons.append(letterM)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnN(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "N"
                guessUsedButtons.append(letterN)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnO(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber  <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "O"
                guessUsedButtons.append(letterO)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }

            }
            
        }
    }
    @IBAction func btnP(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "P"
                guessUsedButtons.append(letterP)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnQ(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "Q"
                guessUsedButtons.append(letterQ)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnR(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "R"
                guessUsedButtons.append(letterR)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnS(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "S"
                guessUsedButtons.append(letterS)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnT(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "T"
                guessUsedButtons.append(letterT)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnU(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "U"
                guessUsedButtons.append(letterU)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnV(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "V"
                guessUsedButtons.append(letterV)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnX(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "X"
                guessUsedButtons.append(letterX)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnW(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "W"
                guessUsedButtons.append(letterW)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnY(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "Y"
                guessUsedButtons.append(letterY)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
    @IBAction func btnZ(_ sender: Any)
    {
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            if(gridCollumnNumber >= 0 && gridCollumnNumber <= 4)
            {
                grid[gridRowNumber][gridCollumnNumber].text = "Z"
                guessUsedButtons.append(letterZ)

                if(gridCollumnNumber != 4)
                {
                    gridCollumnNumber += 1
                }
            }
            
        }
    }
}

