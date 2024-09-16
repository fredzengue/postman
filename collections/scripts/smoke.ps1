$collections = @("../register.postman_collection.json", "../login.postman_collection.json", "../posts.postman_collection.json", "../account.postman_collection.json")


$environment = "../../env/logwire4.postman_environment.json"


foreach ($collection in $collections) {
    Write-Host "Exécution de la collection: $collection"
    newman run "$collection" -e "$environment" --reporters allure
}