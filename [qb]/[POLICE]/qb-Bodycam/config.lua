


QB = {
    allowedJob = { 'police' },
    webhook = "https://discord.com/api/webhooks/1269294341549981788/4g_PbCBliRJxKe3uuC9AA3c7rjNNMwOaF9g-pKdYro87GXE-04TOSzLSKwABJh37vFYy",
    Framework = "qb",
    Footer = "You can see the records of bodycam in this page.",
    Header = "LOS SANTOS POLICE DEPARTMENT BODYCAM RECORDS",
    recordDesc = "Police Department Bodycam Record",
    recordName = "Police Bodycam Record",

    Commands = {
        [1] = {
            command = "records",
            action = "recordmenu",
            desc = "Records Menu",
        },
        [2] = {
            command = "bodycam",
            action = "bodycam",
            desc = "Turn On/Off Bodycam"
        },
    }
}
