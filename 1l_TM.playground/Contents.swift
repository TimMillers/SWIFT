import UIKit

var str = "Hello, playground"


// 1. Reshenie kvadratnogo uravneniya  ax^2+bx+c=0

var a = 5
var b = 10
var c = 2
var x1 = Double()
var x2 = Double()

var D = pow(Double(b),Double(2))-(Double)(4*a*c) // D - diskriminant

if (D<0){
    print ("korney net")
}

if (D==0)
{
    x1 = (-(Double)(b)+(Double)(sqrt(D)))/(Double)(2*a)
}

if (D>0){
    x1 = (-(Double)(b)+(Double)(sqrt(D)))/(Double)(2*a)
    x2 = (-(Double)(b)-(Double)(sqrt(D)))/(Double)(2*a)
}


// 2. Dani kateti pryamougolnogo treugolnika. Naiti Ploshad, Perimetr, Gipotenuzu treugolnika.

var c1 = 3
var c2 = 4

var s = Double(c1*c2)/Double(2)
var h = sqrt(Double(c1*c1)+Double(c2*c2))
var p = Double(c1+c2)+h


// 3. Polzovatel vvodit summu vklada v bank i godovoi procent. Naiti summu vklada cherez 5 let.

typealias Ruble = Double
typealias Percent = Double

var AmountOfDeposit : Ruble = 45.0
var AnnualPercentage : Percent = 10.0
var MeterYears = 1

while MeterYears <= 5{
let AnnualIncome = AmountOfDeposit / 100.0 * AnnualPercentage
AmountOfDeposit = AmountOfDeposit + AnnualIncome
MeterYears += 1
}

print("Summa vklada s procentami za 5 let sostovlyaet ",AmountOfDeposit ,"Rubley")
