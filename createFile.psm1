class CreateFile {
    #hidden props (hides properties from the outside)
    hidden [string] $FileName
    hidden [int32] $Count
    hidden [string] $text

    #Constructor
    CreateFile ([String] $FileName, [int32] $Count, [string] $text) {
        $this.FileName = $FileName
        $this.Count = $Count
        $this.text = $text
    }
    #Return counter value method 
    [string] GetCounter() {
        return $this.Count
    } 
     
    #Reset counter method 
    [string] SetCounter([string] $value) {
        $this.Count = $value
        return 'Count updated to {0}!' -f $value
    } 

    #While counter is smaller that this.count write to output file
    [string] WriteToFile() {
        $counter = 0
        while ($counter -lt $this.Count) {
            $this.text | Out-File $this.FileName -Append
            $counter++
        }
        return "Write file successfully!"
    }  
}