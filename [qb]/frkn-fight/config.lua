FRKN = {
    -- OPEN MENU COMMAND "openfight"
    --BEFORE RUNNING THE SCRIPT, YOU MUST SET THE COORDINATES OF THE ENTRY AND EXIT COORDINATES OF THE FIELD
    EnterAreaText = "[E] Go to the fight zone",
    QuitAreaText = "[E] Get out of the fight zone",
    EnterAreaTextCoords = vector3(4183.345215, 7768.773438, 892.849854),
    QuitAreaTextCoords = vector3(4190.345215, 7768.773438, 892.849854),
    MoneyPropCoords = vector3(4142.301547, 7775.261719, 896.484753),
    MiddleringCoords = vector3(4142.301547, 7775.261719, 892.684753),
    PlaceLadderText = "[E] Place the Ladder",
    PropText = " [E] Take the money ",
    TakeStairsText = "[E]  Hold the Ladder",
    ClimbLadder = "[E] Climb the Ladder",
    CaseMoney = 500, 
    BetWait = 5000,
    StandingLadderTime = 10000 , -- Determines the time to stand on the stairs
    StairsSystem = false,
    FatalPunchValue = 60,
    RepeatAnimationCount = 3, --How many times should he repeat the warm-up animation when the fight starts? 
    TargetPlayerCoords = {
        coords = vector3(4146.125000, 7775.004883, 893.684021),
        heading = 78.776245117188
    },
    SourcePlayerCoords = {
        coords = vector3(4138.588867, 7775.935059, 893.684021),
        heading = 268.365,60058594
    },
}



FRKN.Area = {
    [1] = { -- FIGHT ARENA COORD
        zones = {
            vector2(4146.115732, 7774.954102), vector2(4143.221191, 7778.96773),
            vector2(4138.694336,7775.997559), vector2(4141.665039,7771.795410)
        },
        minZ = 28.2,
        maxZ = 30.4 
    }
}

FRKN.RandomImg = { -- random user image
    "https://64.media.tumblr.com/4277b5d1b428f17b9bef69778b702d39/a025ab39f04f5d82-19/s250x400/e320ea166fbfd0ae6b4c507e5744245c0e233d06.png",
    "https://64.media.tumblr.com/03da706c20573c8dae90ee3b4b6db54e/ee9f54f3b6d04884-7a/s250x400/946cd7e572c7ed28919949e28b48cbfdf49e0fc6.png",
    "https://64.media.tumblr.com/2cd064dc42ee36418c75bb5d4fbc54c9/fa3c6ba7b7eec6f4-90/s250x400/ac4a800a76dcb0a3450908acc2a0acda1791ce91.png",
    "https://64.media.tumblr.com/2cd064dc42ee36418c75bb5d4fbc54c9/fa3c6ba7b7eec6f4-90/s250x400/ac4a800a76dcb0a3450908acc2a0acda1791ce91.png",
    "https://64.media.tumblr.com/3585190bcda1d6565ecb5099b38d6945/aa0b876e21840d91-6f/s250x400/1f377d9029ba7764e8b594c826b07a5d687f3ffe.png",
    "https://64.media.tumblr.com/be6b80c55cab67ca890f40425a6bc9b0/96ab1f04cbbcda08-31/s250x400/2a82fe59c8b4f651d10f3ef84ff8afefa8cfdf54.jpg",
    "https://64.media.tumblr.com/65d7443d5e3a5988a7f7941f9f4b3a31/e1fc6ffd3c634b45-fc/s250x400/35fd84cec0777f496f4a262b6019817979b97490.png",
    "https://64.media.tumblr.com/7d34befb5e0e7189549952e68e3d0449/016b9cecae99033f-e0/s250x400/a07677c4d5caa432e780bbf61e5a0962c06465ec.png",
    "https://64.media.tumblr.com/954225ecbc5265d7a40f2065823b309b/29beb51515c0c663-2d/s250x400/ddc2f56b24172f89e9f4c5c7312dd2c5c3a1aa2f.png",
    "https://64.media.tumblr.com/b22fb6c256dd4676d7aa3ff17a7ad7fc/637986e534a4b5b0-89/s250x400/fd9f41ac7232306c7c59e308fee9ae633c389e09.jpg",
    "https://64.media.tumblr.com/30f3d315d904d8e2e717b2d9a11b69c5/a13e45c8ee1b43cf-11/s250x400/cef614643c61906557f81477602723a6f9f2956e.png",
    "https://64.media.tumblr.com/b07bc95fa5344600392fb1bb612a638d/fbaa5aea86699bf3-ee/s250x400/626411d4ce3254e1f6f75789ae6ef92fde869ebf.png",
    "https://64.media.tumblr.com/9faa139b92c9ab6563a1dce92da63eb3/7eef6442279158a9-b5/s250x400/30c8fa817efadd75c28431c28dae746bd3a3be62.png",
    "https://64.media.tumblr.com/070999177c1bb910fd623fd9ebed0474/1452d092177ec38a-6a/s250x400/62c0ff39b37463e6a4b0e3aa2465600d897e12c3.png",
    "https://64.media.tumblr.com/b5d25b0b1c54de87d7c8c73f13a70b61/b7d396af235a6da1-92/s250x400/aa6f9c43e033a7f047fad6cd70011fb449eba4a7.png",
    "https://64.media.tumblr.com/4079fd17aebd9f395cbc5596a989aadb/4991574067cedf7a-e9/s250x400/5a654a7d45ae627de24d36ff1b4ce850774382fb.png",
    "https://64.media.tumblr.com/889b4ad444eea7833e7093c82e43d6e1/ed422bd94c715c3e-84/s250x400/43244d3990f31a311102946e5125e88a138a0373.png",
    "https://64.media.tumblr.com/b50b5e7bcfbb263f8aa0a919881ce690/3fd550c1fdb865f6-45/s250x400/555815b6c31d4ce7b279a31ea0594bc2cbb7adb7.png",
    "https://64.media.tumblr.com/55282200b0424f49668dde9bf88322b8/d5c4ac6664eda9b7-73/s250x400/b5d134d8d2130444eeeae4337b1282256f6835d2.png",
    "https://64.media.tumblr.com/4d4eeb412f1740db0a2331fc51cb9e4f/766f10aa07e018e1-43/s250x400/1b1113ccfca33d5aa04f5ab89e773434b2534e3c.png",
    "https://64.media.tumblr.com/c614fb4b6c442cfe736731c01e312e9f/6b7af815fa3a8d8b-47/s250x400/c7219e373ad4ea97067de0dd11195bb33f28f368.png",
    "https://64.media.tumblr.com/874a5cc1f7d22d9b974c494180cbccf4/3f231190a879b184-2c/s250x400/932b6f5d2b4c392b3fce9e92dd6e42809ee224e3.png",
    "https://64.media.tumblr.com/df301e16122e4b7df5b139aa2df8ea75/d705df56f6335e48-b0/s250x400/830d8dbc8fd36b65687c8579d36856c8095fb57d.png",
    "https://64.media.tumblr.com/118abc65ea52f76e8e51af1e6efa61aa/1c71316b5f8fd211-a3/s250x400/697b7129d58a9efaa32304d87ea5f453bf5587af.png",
    "https://64.media.tumblr.com/0cdefd90fad7fa36cfdc85a7b17c71e2/6e119495c6a13ede-94/s250x400/87019f1cf7021782fa12719ad3ca7aeac0d1fc40.png",
}


Revive = function()
    TriggerEvent('hospital:client:RevivePlayer')
end
