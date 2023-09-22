<h2>Building a Basic File Integrity Montior</h2>


The CIA triad is a model in information security that stands for Confidentiality, Integrity and Availability. It is often thought of as a checklist for evaluating an organization's security. Every time a cyber attack occurs, one of these principles has been broken. Maintaining data integrity is essential to ensure accurate information. Data shown to the public must also maintain integrity to ensure trust. 

<h2>Hashing and File Integrity Monitoring</h2>
File integrity monitoring (FIM) is a technology that monitors and analyses the integrity of operating system (OS), database and application software files. The FIM continuously monitors against a baseline and alerts the user if files have been removed, added, or modified, which could be indicative of a cyber attack. To check if data has been added, removed, or modified, we make use of a hash function. 
<br/>
<br/>
A hash value is a numeric value that uniquely identifies data, and any time the data is changed, the hash value changes too. A File Integrity Monitor stores a baseline of hash values for a particular data set, and then continuously monitors the data set to check if the hash values have been altered, which signifies the data has been corrupted. 
<br/>
<br/>
To build this, we need to install PowerShell:
<br/>

<h2>Installing PowerShell</h2>
<b>On MacOS:</b>
<br/>
<br/>
Launch terminal and install Homebrew using the following command:
<br/>
<br/>

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install PowerShell using 
`
brew install --cask powershell
`
.

You can use 
`
pwsh
`
to verify this has worked.
