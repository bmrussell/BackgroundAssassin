# BackgroundAssassin
Kill unwanted process for playing games and restart when finished

## Usage
Edit `killservices.txt`, start and stop as follows:
### Stopping Services
```
cat .\killservices.txt | .\Assasinate-Services.ps1
```

### Starting Services

```
cat .\killservices.txt | .\Revive-Services.ps1
```