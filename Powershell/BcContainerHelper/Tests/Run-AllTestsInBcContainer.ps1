[string]$containerName = "Container name"

# Define clear text string for username and password
[string]$userName = 'Username'
[string]$userPassword = 'Password'

# Convert to SecureString
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credential = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

# Run all tests found in BC Container
Run-TestsInBcContainer `
  -containerName $containername `
  -credential $credential `
  -JUnitResultFileName "c:\ProgramData\BcContainerHelper\$containername.results.xml" `
  -GitHubActions "warning"