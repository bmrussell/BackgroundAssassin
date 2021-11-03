# BackgroundAssassin
Kill unwanted process to reduce background CPU utilisation.

No ads, game stores, upselling made up currency bucks or bloat. \*cough\* Razer Coretex \*cough\* :)

## Setup

1. Edit `Assasinate-Processes.txt` and `Assasinate-Services.txt` to list the processed and services to be stopped. Blank or lines starting with `#` are ignored.
2. A list of running services and processed can be obtained by running `Get-Running-Services.ps1' and `Get-Running-Processes.ps1'. Run these and look in the generate files `services.csv` and `processes.csv`
## Usage

```
./Assasinate.ps1
```
Kills processes & services and waits for keypress before restarting them

or 
```
./Assasinate.ps1 c:\path\program.exe
```
Kills processes & services, executes the supplied program and waits it to finish before restarting processes & services

**Notes**:
1. The kill/restart portion of the script runs as admin so will trigger the Windows UAC prompt.
2. If some services fail to start/stop, try changing the order of them in the input text files

## TODO
1. Test the launching program option 