$baseurl = "https://play.google.com/store/apps/details?id="

$apps = @(
    "com.bereal.ft", 
    "com.x8bit.bitwarden",
    "jp.co.canon.ic.cameraconnect"
    "com.shc.chi",
    "com.ctatracker.chicagotransitcta",
    "sp0n.citizen",
    "com.fandom.playercompanion",
    "com.discord",
    "com.motivateco.chicagoapp",
    "com.personalcapital.pcapandroid",
    "com.devhd.feedly",
    "co.hinge.app",
    "com.instagram.android",
    "com.lemonadeinc.lemonade",
    "me.lyft.android",
    "com.azure.authenticator",
    "com.myfitnesspal.android",
    "com.payrange.payrange",
    "com.reddit.frontpage",
    "com.starbucks.mobilecard",
    "com.instagram.barcelona",
    "com.tinder",
    "com.venmo",
    "com.ventrachicago.riderapp",
    "com.weather.forecast.weatherchannel",
    "com.whatsapp"
)

foreach ($app in $apps) {
    Start-Process "${baseurl}${app}"
}
