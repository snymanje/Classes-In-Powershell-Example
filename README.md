# Classes-In-Powershell-Example
An introduction to using classes in Powershell

The release of Powershell 5 added classes to help simplify the way we write powershell code. Classes brings Object-Oriented Programming to Powershell, it helps us encapsulate and localize variables and methods by creating objects. Current Powershell scripts have a few common problems like code duplication and encapsulation issues were you are forced to clear or rename variables. We can improve on this with the use of classes. Scripts that have hundreds of lines of code, can be split into modules using OOP.
Lets create a simple script to demonstrate OOP in powershell.


First you need to create a module for the class. So create a new file and call it createFile.psm1 then add the code below.

```
class CreateFile {
    //hidden props (hides properties from the outside)
    hidden [string] $FileName
    hidden [int32] $Count
    hidden [string] $text

    //Constructor
    CreateFile ([String] $FileName, [int32] $Count, [string] $text) {
        $this.FileName = $FileName
        $this.Count = $Count
        $this.text = $text
    }
    //Return counter value method 
    [string] GetCounter() {
        return $this.Count
    } 
     
    //Reset counter method 
    [string] SetCounter([string] $value) {
        $this.Count = $value
        return 'Count updated to {0}!' -f $value
    } 

    //While counter is smaller that this.count write to output file
    [string] WriteToFile() {
        $counter = 0
        while ($counter -lt $this.Count) {
            $this.text | Out-File $this.FileName -Append
            $counter++
        }
        return "Write file successfully!"
    }  
}
```



The next step is to import this module in your ps1 script file. Create a new file in the same directory and call it main.ps1 or anything you want. Add the below code and save the files.

```
#import the module
using module "F:\PowerShell\createFile.psm1"

#Create new instance of class and pass the parameters for the constructor
$obj = [CreateFile]::new("logs.txt", 50, "This is OOP in PowerShell")

#Calling the GetCounter method to see the value.
$obj.GetCounter()

#Calling the SetCounter to update the method.
$obj.SetCounter(10)

#Calling the WriteToFile method
$obj.WriteToFile()
```

When the above code is run you will see the below output.

```
##Console output
50
Count updated to 10!
Write file successfully!
```



This is just a simple example using classes in powershell to get you started. You can go here for more details, https://xainey.github.io/2016/powershell-classes-and-concepts/



Thanks for reading! 
