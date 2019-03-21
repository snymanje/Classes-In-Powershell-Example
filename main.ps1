#import the module
using module "C:\Users\jean_\Google Drive\Visual Studio\Powershell\createFile.psm1"

#Create new instance of class and pass the parameters for the constructor
$obj = [CreateFile]::new("logs.txt", 50, "This is OOP in PowerShell")

#Calling the GetCounter method to see the value.
$obj.GetCounter()

#Calling the SetCounter to update the method.
$obj.SetCounter(10)

#Calling the WriteToFile method
$obj.WriteToFile()