Param(
# React App name
[Parameter(Position=0, Mandatory=$true)]
[ValidateLength(3,15)]
[ValidatePattern("\w*")]
[String]
$ReactAppName,
# Poject Directory
[Parameter(Position=1, Mandatory=$false)]
[String]
$ProjectDirectory = ".\"
)
function Scaffold {
    Set-Location $ProjectDirectory
    dotnet new reactredux -o $ReactAppName
    dotnet dev-certs https --clean
    dotnet dev-certs https --trust
    Set-Location "$ProjectDirectory\$ReactAppName\ClientApp"
    npm install
    npm audit fix
    Set-Location ..\..\
    git add -A 
    git commit -a -m "App init"
}

Scaffold



