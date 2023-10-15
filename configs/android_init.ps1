$baseurl = "https://play.google.com/store/apps/details?id="

$apps = @(
    "co.hinge.app",
    "com.authy.authy",
    "com.azure.authenticator",
    "com.bereal.ft", 
    "com.ctatracker.chicagotransitcta",
    "com.devhd.feedly",
    "com.discord",
    "com.fandom.playercompanion",
    "com.instagram.android",
    "com.instagram.barcelona",
    "com.lemonadeinc.lemonade",
    "com.motivateco.chicagoapp",
    "com.myfitnesspal.android",
    "com.payrange.payrange",
    "com.personalcapital.pcapandroid",
    "com.reddit.frontpage",
    "com.starbucks.mobilecard",
    "com.tinder",
    "com.trainerize.chicagoathleticclub",
    "com.venmo",
    "com.ventrachicago.riderapp",
    "com.weather.forecast.weatherchannel",
    "com.whatsapp"
    "com.x8bit.bitwarden",
    "jp.co.canon.ic.cameraconnect"
    "me.lyft.android",
    "notion.id",
    "sp0n.citizen",
)

foreach ($app in $apps) {
    Start-Process "${baseurl}${app}"
}
