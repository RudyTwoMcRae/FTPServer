#Get the Username and Password of the user to be created from the parameters
param($CU_Usersname, $CU_Password, $WONumber, $LIs)

#Create SSH Session to FTP Server
$Pass = ConvertTo-SecureString "McRaeDM4090" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("rudy", $Pass)
$Session = New-SSHSession -ComputerName 192.168.0.91 -Credential $Cred

#Run the UserCreate.sh script to create a new user on the FTP Server
$Stream = $Session.Session.CreateShellStream("PS-SSH",0,0,0,0,1000)
$Result = Invoke-SSHCommand -SSHSession $Session -Command "id -u $($CU_Usersname)"
if ($Result.Output -ge 1000) {
    echo "The User already exists"
} else {
    $Result = Invoke-SSHStreamExpectSecureAction -ShellStream $Stream -Command "sudo ./UserCreate.sh $($CU_Usersname) $($CU_Password)" -ExpectString "[sudo] password for rudy:" -SecureAction $Pass
}

#Create a new folder for the work order
$Result = Invoke-SSHCommand -SSHSession $Session -Command "cd /home/$($CU_Usersname); mkdir $($WONumber)"
sleep -Milliseconds 100

#Create folders for each line item
foreach($li in $LIs) {
    $Result = Invoke-SSHCommand -SSHSession $Session -Command "cd /home/$($CU_Usersname)/$($WONumber); mkdir 'LI-$($li)'; chmod -R 777 'LI-$($li)'"
}

sleep -Seconds 1
Remove-SSHSession -SSHSession $Session
