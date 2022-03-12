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
    public var wordle : String?
    public var guess : String?
    public var wordyDict = Dictionary<Int, Character>()
    public var debugMode : Bool = true
    private var guessUsedButtons = [UIButton]()
    private var gridRowNumber = 0
    private var gridCollumnNumber = 0


    
    private var rowA = [UILabel]()
    private var rowB = [UILabel]()
    private var rowC = [UILabel]()
    private var rowD = [UILabel]()
    private var rowE = [UILabel]()
    private var rowF = [UILabel]()
    private var rowG = [UILabel]()
    private var grid = [[UILabel]]()
   
    

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


        //self.wordle = "pizza"
        //self.lblTest.text = "DebugMode: " + String(self.wordle!)
        //fillWordyDictionary()

        apiCallRandomWord()
                
    }

    //This function will call the API to get an array of randomized words
    func apiCallRandomWord()
    {
        //let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(wordInput)")!
        //let url = URL(string: "https://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=20&swear=0")!
        URLSession.shared.fetchDataRandomWord(at: url) { result in
          switch result {
          case .success(let words):
              print("\nArray of words as a response is --> \(words)\n")
              //self.responseGlobal = words
              
              //Now we have to pick one word from the array that meets the criterias
              self.pickWord(array: words)
              
          case .failure(let error):
              DispatchQueue.main.async
              {
                  Dialog.ok(view: self, title: "Error", message: "Failed to make request to API.")
                  print(error)
              }
              
          }
        }
    }
    
    //Continuing from the success thread of the Random Word API -> This function will iterate through the array and pick one word that meets all the criterias: have 5 chars and be a real word on the english dictionary
    func pickWord(array : [String])
    {
        var metCriteria : Bool = false
        var chosenWord : String = ""
        for element in array{
            if(hasCorrectLength(strParameter: element))
            {
                metCriteria = true
                chosenWord = element
                break
                //apiCallDictionary(str: element, mode: "word")
            }
            else
            {
                metCriteria = false
            }
        }
        
        //None of the words from the array met the criteria of 5 chars, call again
        if(metCriteria == false)
        {
            apiCallRandomWord()
        }
        else
        {
            apiCallDictionary(str: chosenWord, mode: "word")
        }

    }
    
    //This function will call the english dictionary API to check if the string passes is valid
    func apiCallDictionary(str : String, mode : String)
    {
        
        let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(str)")!
        //let url = URL(string: "https://geodb-free-service.wirefreethought.com/v1/geo/countries?limit=5&hateoasMode=off")!
        URLSession.shared.fetchDataDictionary(at: url) { result in
          switch result {
          case .success(let words):
              print("\nDictionary response -> \(words)")
              if(mode == "word")
              {
                  //Set the global variable
                  self.wordle = str
                  self.fillWordyDictionary()
                  if(self.debugMode == true)
                  {
                      DispatchQueue.main.async
                      {
                          self.lblTest.text = "DebugMode: " + String(self.wordle!)
                      }
                  }
              }
              else if(mode == "guess")
              {
                  //Call function to compare with wordle
                  self.guess = str
                  self.guessProcedureCheck(arrayOfButtons : self.guessUsedButtons)
              }
              //Show waiting screen after
              
          case .failure(let error):
              print(error)
              if(mode == "word")
              {
                  self.apiCallRandomWord()
              }
              else if(mode == "guess")
              {
                  DispatchQueue.main.async
                  {
                      Dialog.ok(view: self, title: "Invalid word", message: "The word entered does not exist in the English dictionary.")
                      self.resetGuess()
                  }

              }
          }
            
        }
        
    }
    
    //Continuing from the success thread of the Dictionary API -> This function will put the word into a dictionary with the char as the key and the index as the value to facilitate iteration later
    func fillWordyDictionary()
    {
        for (index, letter) in self.wordle!.enumerated()
        {
            self.wordyDict[index] = letter
        }
    }
    
    //This function will check if the string has the correct amount of chars we need
    func hasCorrectLength(strParameter : String) -> Bool
    {
        if(strParameter.count == 5)
        {
            return true
        }
        return false
    }
    
    //Continuing from the success thread of the Dictionary API -> This function will put the word into a dictionary with the char as the key and the index as the value to facilitate iteration later
    func guessProcedureCheck(arrayOfButtons : [UIButton])
    {
        //Check if it's the correct guess
        if(!isCorrectGuess(guess: self.guess!))
        {
            //Check each char of the guess to match with the word
            for (index, letterGuess) in self.guess!.enumerated()
            {
                //Update view on the main thread right away
            
                //Chang key from letter to be the index in order to fix the problem with repetitive words
                if(self.wordyDict.values.contains(letterGuess) == true)
                //if self.wordyDict[letterGuess] != nil
                {
                    //if((self.wordyDict[letterGuess]) == index)
                    if(self.wordyDict[index] == letterGuess)
                    {
                        DispatchQueue.main.async
                        {
                            arrayOfButtons[index].backgroundColor = .green
                        }
                    }
                    else
                    {
                        if(arrayOfButtons[index].backgroundColor != .green && arrayOfButtons[index].backgroundColor != .red && arrayOfButtons[index].backgroundColor != .yellow)
                        {
                            DispatchQueue.main.async
                            {
                                arrayOfButtons[index].backgroundColor = .yellow
                            }
                        }
                        
                    }
                }
                //Letter is not correct
                else
                {
                    DispatchQueue.main.async
                    {
                        //Modify the background only if it was never modified before
                        if(arrayOfButtons[index].backgroundColor != .green && arrayOfButtons[index].backgroundColor != .red && arrayOfButtons[index].backgroundColor != .yellow)
                        {
                            
                                arrayOfButtons[index].backgroundColor = .red
                            
                        }
                    }
                }
                
            }
            //After checking we need to empty the used buttons array to receive new ones and reset to receive a new guess
            self.guessUsedButtons.removeAll()
            self.gridCollumnNumber = 0
            self.gridRowNumber += 1
            
            //Check if player still has guesses available
            if(self.gridRowNumber == 5)
            {
                DispatchQueue.main.async
                {
                    Dialog.ok(view: self, title: "Defeat", message: "You exceeded the number of guesses.")
                    //Call Dialog asking if the player wants to reset the game and if yes, call the function to do so
                    self.gridRowNumber = 0
                    self.gridCollumnNumber = 0
                    self.apiCallRandomWord()
                }
           
            }
        }
    }
    
    func isCorrectGuess(guess : String) -> Bool
    {
        //Player guessed the word
        if(self.wordle == guess)
        {
            DispatchQueue.main.async
            {
                self.guessUsedButtons[0].backgroundColor = .green
                self.guessUsedButtons[1].backgroundColor = .green
                self.guessUsedButtons[2].backgroundColor = .green
                self.guessUsedButtons[3].backgroundColor = .green
                self.guessUsedButtons[4].backgroundColor = .green
                Dialog.ok(view: self, title: "Victory", message: "Congratulations, you guessed the word correctly.")
                self.resetGuess()
                self.gridCollumnNumber = 0
            }
            return true
            //Reset the game with a new randomly generated word
        }
        return false
    }
    
   func resetGuess()
    {
        self.gridCollumnNumber = 0
        self.grid[self.gridRowNumber][0].text = ""
        self.grid[self.gridRowNumber][1].text = ""
        self.grid[self.gridRowNumber][2].text = ""
        self.grid[self.gridRowNumber][3].text = ""
        self.grid[self.gridRowNumber][4].text = ""
    }

    
    //This function will be triggered when the player presses the submit button.
    @IBAction func btnSubmitTouchUp(_ sender: Any) {
        var wordGuess : String = ""
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            //Word guess is finished
            if(gridCollumnNumber >= 4)
            {
                //Saving each char of the guess to compose the wordGuess
                wordGuess += grid[gridRowNumber][0].text!.lowercased()
                wordGuess += grid[gridRowNumber][1].text!.lowercased()
                wordGuess += grid[gridRowNumber][2].text!.lowercased()
                wordGuess += grid[gridRowNumber][3].text!.lowercased()
                wordGuess += grid[gridRowNumber][4].text!.lowercased()
                
                //Check if has the correct length
                if(hasCorrectLength(strParameter: wordGuess))
                {
                    apiCallDictionary(str: wordGuess, mode: "guess")
                }
                else
                {
                    DispatchQueue.main.async
                    {
                        self.resetGuess()
                        Dialog.ok(view: self, title: "Invalid guess", message: "Incorect amount of chars.")
                    }
                    
                }

            }
        }
    }
    
    //This function will be triggered when the player presses the delete button
    @IBAction func btnDeleteTouchUp(_ sender: Any)
    {
        //Check if word guess is finished
        if(gridRowNumber >= 0 && gridRowNumber <= 6)
        {
            //Check if the player already deleted every char from the guess
            if(gridCollumnNumber >= 0)
            {
                DispatchQueue.main.async
                {
                    self.grid[self.gridRowNumber][self.gridCollumnNumber].text = ""
                    self.guessUsedButtons.removeLast()
                    if(self.gridCollumnNumber > 0)
                    {
                        self.gridCollumnNumber -= 1
                    }
                }
          
            }
            
        }
    }
    
    
    //Declaration of Actions for the keyboard
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

