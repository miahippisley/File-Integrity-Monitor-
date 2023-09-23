
Function Calculate-File-Hash($path) {
    $hash = Get-FileHash -Path $path -Algorithm SHA512
    return $hash
}

Function Remove-Any-Existing-Baseline() {
    $baselineExists = Test-Path -Path ./baseline.txt

    if ($baselineExists) {
        # Delete it
        Write-Host "Baseline already exists."
        Write-Host "Deleting existing baseline ..."
        Write-Host "Creating new baseline ..."
        Remove-Item -Path ./baseline.txt
    }
}


Write-Host ""
Write-Host "Hello! Please choose an option:"
Write-Host ""
Write-Host "    A) Collect a New Baseline"
Write-Host "    B) Monitor Files Using Existing Baseline"
Write-Host ""

$response = Read-Host -Prompt "Enter 'A' or 'B'"
Write-Host ""

if ($response -eq "A".ToUpper()) {
    # Remove existing baseline.txt if it already exists
    Remove-Any-Existing-Baseline

    # Calculate Hash from the target files and store in baseline.txt
    # Collect all files in the target folder
    $FIM = Get-ChildItem -Path ./Files

    # For each file, calculate the hash, and write to baseline.txt
    foreach ($f in $FIM) {
        $hash = Calculate-File-Hash $f.FullName
         "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
    }
    Write-Host "New baseline was created."
}


elseif ($response -eq "B".ToUpper()) {

    Write-Host "Starting file monitoring..."
    Write-Host "You will be notified of any changes here"
    Write-Host "For more details about changes, check logs.txt"
    Write-Host "Press [CTRL+C] to stop monitoring."
    
    $fileHashDictionary = @{}

     # Load file|hash from baseline.txt and store them in a dictionary
    $filePathsAndHashes = Get-Content -Path ./baseline.txt

   foreach ($f in $filePathsAndHashes) {
         $fileHashDictionary.add($f.Split("|")[0],$f.Split("|")[1])
         $f.Split("|")
    }


     # Begin (continuously) monitoring files with saved Baseline
    while ($true) {
        Start-Sleep -Seconds 1
        
        $files = Get-ChildItem -Path ./Files
        
        # For each file, calculate the hash, and write to baseline.txt
        foreach ($f in $files) {
            $hash = Calculate-File-Hash $f.FullName
            #"$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
            
            # Notify if a new file has been created
            if ($fileHashDictionary[$hash.Path] -eq $null) {
                # A new file has been created!
                Write-Host "$($hash.Path) has been created!" -ForegroundColor Red
            }
            else {

                # Notify if a new file has been changed
                if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
                    # The file has not changed
                }
                else {
                    # File has been compromised!, notify the user
                    Write-Host "$($hash.Path) has changed!!!" -ForegroundColor Red
            
                }
            }
        }
    

        foreach ($key in $fileHashDictionary.Keys) {
            $baselineFileExists = Test-Path -Path $key
            if (-Not $baselineFileExists) {
                # One of the baseline files must have been deleted, notify the user
                Write-Host "$($key) has been deleted!" -ForegroundColor Red 
            }
        }
    }
}
    


