<h2>Building a Basic File Integrity Montior</h2>


The CIA triad is a model in information security that stands for Confidentiality, Integrity and Availability. It is often thought of as a checklist for evaluating an organization's security. Every time a cyber attack occurs, one of these principles has been broken. Maintaining data integrity is essential to ensure accurate information. Data shown to the public must also maintain integrity to ensure trust. 

<h2>Hashing and File Integrity Monitoring</h2>
File integrity monitoring (FIM) is a technology that monitors and analyses the integrity of operating system (OS), database and application software files. The FIM continuously monitors against a baseline and alerts the user if files have been removed, added, or modified, which could be indicative of a cyber attack. To check if data has been added, removed, or modified, we make use of a hash function. 
<br/>
<br/>
A hash value is a numeric value that uniquely identifies data, and any time the data is changed, the hash value changes too. A File Integrity Monitor stores a baseline of hash values for a particular data set, and then continuously monitors the data set to check if the hash values have been altered, which signifies the data has been corrupted. 
<br/>
<br/>
This project was inspired by Josh Madakor's youtube video, check out his youtube channel for cyber security related content.
<br/>
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

Once installed, connect to PowerShell using the `pwsh` command.
<br/>
<br/>

<b>On Windows:</b>
<br/>
1. Click the magnifying glass on the taskbar or press Win + S to open the search menu.
2. Type Command Prompt in the search box at the top.
3. Select Run as administrator to open Command Prompt with administrative privileges.
4. Select Yes when the User Account Control (UAC) prompt appears.
5. Paste the following command in the console and press Enter to view all the available versions of the PowerShell app.

```
winget search Microsoft.PowerShell
```

Output:

```
Name               Id                           Version Source
--------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.3.7.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.4.0.3 winget
```

<br/>

Install PowerShell or PowerShell Preview using the `id` parameter:

```
winget install --id Microsoft.Powershell --source winget
winget install --id Microsoft.Powershell.Preview --source winget
```
<br/>
<b>On Ubuntu:</b>
<br/>
<br/>
Install the Snap package manager using:

```
apt-get install snap snapd -y
```

Once installed, you can install PowerShell with:

```
snap install powershell --classic
```
Once installed, connect to PowerShell using the `pwsh` command.
<br/>
<br/>
<h2>Running the Script</h2>

Open the command line and run the `pwsh` command to start PowerShell.
<br/>
<br/>
Powershell scripts use the '.ps1' extension. Navigate to the desktop and then use a text editor to create the script file:

```
cd desktop
```

```
Vim fim.ps1
```

Paste in the source code attached. 
<br/>
<br/>
To run the script, using PowerShell, type `./fim.ps1`  into the command line. 


If one selects A, collect new baseline, the programme will go into the files folder, examine all of the text files, and store the file path and file hashes of each text file in a baseline called 'baseline.txt'.
<br/>
<br/>
After creating the baseline, selecting B instructs the programme to begin continuously monitoring the files within the saved baseline. Each loop, the FIM takes the hashes for the baseline created, calculates the hashes for the files, and determines if there is a difference. If the integrity of the files has been compromised, because data has been added, removed, or modified, the FIM sends an alert.

<br/>
<br/>
<img width="474" alt="image" src="https://github.com/miahippisley/File-Integrity-Monitor-/assets/127256439/08edca5d-faeb-4f98-b35b-5d8c43619907">

