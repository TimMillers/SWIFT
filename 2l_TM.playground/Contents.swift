import UIKit

var str = "Hello, playground"

// 2.1 Написать функцию, которая определяет, четное число или нет.
func isEvenNumber(_ value: Int) -> Bool {
    return value % 2 == 0
    }

// 2.2  Написать функцию, которая определяет, делится ли число без остатка на 3.

func isNumber(_ value: Int) -> Bool {
    return value % 3 == 0
    }

// 2.3  Создать возрастающий массив из 100 чисел.

var someArray: Array<Int> = Array(1...100)

// 2.4  Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

someArray.removeAll(where: {isEvenNumber($0) || !isNumber($0)})
print(someArray)

// 2.5 * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

var res_fibonacci: [Decimal] = []

func fillArrayWithFibonacci(array: inout [Decimal], elements: UInt) {
    repeat{
        if array.count == 0 {
            array.append(0)
        } else if array.count == 1 {
            array.append(1)
        } else {
            array.append(array[array.count - 1] + array[array.count - 2])
        }
    } while array.count < elements
}

fillArrayWithFibonacci(array: &res_fibonacci, elements: 100)
print("\n")
print(res_fibonacci)

// 2.6  * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

var res_primeNumbers: [UInt] = []

func isPrimeNumber(value: UInt) -> Bool{
    if value > 1 {
        for i in 2..<value {
            if value%i == 0 {
                return false
            }
        }
        return true
    }
    return false
}

func fillArrayWithPrimes(array: inout [UInt], elements: UInt){
    var checkNumber: UInt = 0
    repeat{
        if isPrimeNumber(value: checkNumber) {
            array.append(checkNumber)
        }
        checkNumber += 1
    }while  array.count < elements
}

fillArrayWithPrimes(array: &res_primeNumbers, elements: 100)
print("\n")
print(res_primeNumbers.count)
print(res_primeNumbers)
