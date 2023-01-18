import UIKit

var str: String? = nil

if str != nil
{
    print(str!);
}
else
{
    print("NULL");
}

let random: UInt32 = arc4random_uniform(10) + 1;

switch random
{
case 1...5:
    print("1이상 5이하 ", random);
case 6...8:
    print("6이상 8이하 ", random);
default:
    print("9이상 10이하 ", random);
}

for i in (0...10).reversed()
{
    print(i);
}

var array = [4, 5, 6]
for i in 1...array.capacity
{
    print(i);
}
for i in array
{
    print(i);
}
