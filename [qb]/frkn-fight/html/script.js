playerId = 1
glovIndex = 1
userName = ""
value = 0
color = ""
window.addEventListener("message", function (e) {
  $("body").fadeIn(500);
  e = e.data
  switch (e.action) {
    case "openNui":
      return openMenu(e.data)
    case "openRequestPage":
      return requestPage(e.data)
    case "openBet":
      return betPage(e.data)
    case "betClose":
      return betClose()
    case "updateDui":
      return updateDui(e)
    case "close":
      return close()
    case "roundData":
      return roundData(e)
    case "close":
      return close()
    case "betsUpdate":
      return betsUpdate(e)
    case "opendui":
      return dui(e) 
    case "startCounter":
      return countdown()
    default:
      return;
  }
});


let functionBool = false
function updateDui(data) {
  if (functionBool==false) {
      functionBool = true;
      tvUpdate(data)
  }
}

function tvUpdate(data) { 
  setTimeout(() => {
  const minutes = Math.floor(data.time / 60);
  const seconds = data.time % 60;
  
  const formattedTime = padNumber(minutes) + ":" + padNumber(seconds);

  $(".timer").html(formattedTime)
  $(".counter-counter").html(data.currentRoundNumber)
  
  $(".round-counter").html("R"+Number(data.round+1))
  $(".counter-user-1-name").html(data.targetUserName)
  $(".counter-user-2-name").html(data.sourceUserName)

  $(".user-1").html(data.targetUserName)

  $(".user-2").html(data.sourceUserName)

  $(".round-info").html(data.roundCount + "ROUND - " + data.roundTime + "SEC")

  let a = data.sourceHealth;
  let c = data.targetHealth
  let b = 100 - ((a / 200) * 35);
  let d = 100 - ((c / 200) * 35);
  
  $(".health-test").css('right',Number(d)+'%')
  $(".health-2-test").css('left',Number(b)+'%')
  $(".health-2-test").show()
  $(".health-test").show()
      functionBool = false
  }, 1000);
}


$(document).on('click','.fighters-item',function (e) {
  $(".fighters-item").css({'border-left':'3px solid rgba(255, 255, 255, 0.05)','border-right':'3px solid rgba(255, 255, 255, 0.05)'})
  $(this).css({'border-left':'3px solid #18ECB1','border-right':'3px solid #18ECB1'})
})


$(document).on('click','.glov-item',function (e) {
  glovIndex = $(this).data("index")
  $(".glov-item").css({'border':'1px solid rgba(0, 0, 0, 0.05)'})
  $(this).css({'border':'1px solid rgba(255, 255, 255, 0.05)'})
})

$(document).on('click','.bet-pink-arti',function (e) {
  data = $(this).data("type");
  val = parseInt($("."+data).val())
  $("."+data).val(parseInt($("."+data).val())+100)
})

let roundCount = 0;
let roundtimer = "00:00";

$(document).on('click', '.rotate', function (e) {
  const data = $(this).data("type");
  const rotate = $(this).data("rotate");

  if (rotate === "right") {
    if (data === "roundcounter-number") {
      roundCount++;
      $("." + data).html(roundCount);
    } else {
      let roundTime = $("." + data).html().split(":");
      let minutes = parseInt(roundTime[0]);
      let seconds = parseInt(roundTime[1]);

      seconds++;

      if (seconds === 60) {
        minutes++;
        seconds = 0;
      }

      roundtimer = padNumber(minutes) + ":" + padNumber(seconds);
      $("." + data).html(roundtimer);
    }
  } else {
    if (data === "roundcounter-number") {
      if (roundCount > 0) {
        roundCount--;
        $("." + data).html(roundCount);
      }
    } else {
      let roundTime = $("." + data).html().split(":");
      let minutes = parseInt(roundTime[0]);
      let seconds = parseInt(roundTime[1]);

      seconds--;

      if (seconds === -1) {
        minutes--;
        seconds = 59;
      }

      roundtimer = padNumber(minutes) + ":" + padNumber(seconds);
      $("." + data).html(roundtimer);
    }
  }
});

$(document).on('click','.create-button',function (e) {
  const time = $(".timecounter-number").html();
  const round = $(".roundcounter-number").html();

  const [hours, minutes] = time.split(':');
  const totalSeconds = (parseInt(hours, 10) * 3600) + (parseInt(minutes, 10) * 60);

  roundTime = $(".roundtimer-number").html();

  if (glovIndex === 0 || roundCount === 0 || roundTime === "00:00" || playerId === 0) {
    //console.log("Lütfen tüm bilgileri eksiksiz doldurun.");
  }else{
    //console.log("herşey tamam");
    $.post(`http://frkn-fight/createFight`, JSON.stringify({ id: playerId, round: round, roundTime: totalSeconds/60 ,glovIndex:glovIndex}), function (x) {});
    close()
  }

});


function padNumber(number) {
  return number < 10 ? "0" + number : number.toString();
}

function betsUpdate(data) {
  $(".bet-box").empty()
  $.each(data["data"], function (i, v) { 
    $(".bet-box").append(`
    <div class="bet-user">
      <div class="user-img"></div>
      <div class="bet-color" style="background-color:${v.color}"></div>
      <div class="bet-name">${v.betterName}</div>
      <div class="bet-price">$${v.count}</div>
    </div>
    `);
  })
}

function roundData(data) {
    
  const minutes = Math.floor(data.time / 60);
  const seconds = data.time % 60;
  
  const formattedTime = padNumber(minutes) + ":" + padNumber(seconds);

  $(".timer").html(formattedTime)
  $(".counter-counter").html(data.currentRoundNumber)
  
  $(".round-counter").html("R"+Number(data.round+1))
  $(".counter-user-1-name").html(data.targetUserName)
  $(".counter-user-2-name").html(data.sourceUserName)

  $(".user-1").html(data.targetUserName)

  $(".user-2").html(data.sourceUserName)

  $(".round-info").html(data.roundCount + "ROUND - " + data.roundTime + "SEC")

  let a = data.sourceHealth;
  let c = data.targetHealth
  let b = 100 - ((a / 200) * 27);
  let d = 100 - ((c / 200) * 27);
  
  $(".health").css('right',Number(d)+'%')
  $(".health-2").css('left',Number(b)+'%')

  $(".create-fight-page,.bet-page,.ready-page").hide()
  $(".user-info-page,body").show()
}



var mainCount = 15;
let saydim = false;
function dui(data) {
  $("body, .tv-dui-page").show();
  $(".starter").fadeIn(500);

  if (saydim === false) {
    saydim = true;
    say(mainCount);
  }
  
}

function say(mainCount) {
  var countdownInterval = setInterval(function() {
    mainCount--;
    $("#countdown").text(mainCount)
    if (mainCount < 1) {
      $("#countdown").animate({ opacity: 0 }, 500, function() {
        $(this).hide();
      });
      clearInterval(countdownInterval);
      $("#startText").show();
      $(".ftimer").html("31:31")
      startFadeInStartTextAnimation();
    }
  }, 1000);
}



function openMenu(data){
  $(".nearby-append").empty()
  $(".create-fight-page,.user-info-page,.bet-page,.ready-page").hide()
  $("body,.create-fight-page").show()
  $.each(data["nearbyPlayers"], function (i, v) {
    $(".nearby-append").append(`

    <div data-name="${v.name}" data-id="${v.id}" class="fighters-item">
    <img class="profile" src="../images/steam2.png">
    <div class="name">${v.name.slice(0,5)} <span style="font-family: Microgramma Becker Med Extd;">${v.name.slice(5,10)}</span> </div>
    <div class="progress-bg"></div>
    <div class="progress"></div>
    <div class="glov-list">
      <img class="glov-1" src="../images/glov1.png" alt="">
      <img class="glov-2" src="../images/glov2.png" alt="">
      <img class="glov-3" src="../images/glov3.png" alt="">
      <img class="glov-4" src="../images/glov4.png" alt="">
    </div>
  </div>
`)
  })
}


$('.bet-input').on('input', function() {
  color = $(this).data("color")
  userName = $(this).data("name")
  value = $(this).val()
});

$(document).on('click','.bet-button',function (e) {
  $.post(`http://frkn-fight/bet`, JSON.stringify({betType:userName,betCount:value,color:color}), function (x) {
    if (x) {
      //console.log("parası var");
    }else{
      //console.log("parası yok");
    }
    setTimeout(() => {close()}, 1000);
  });
})

function betClose() {
  $(".bet-page").hide()
}

function betPage(data) {
  $(".pinkimg").attr("src",data["fighterData"].sourceImg);
  $(".greenimg").attr("src",data["fighterData"].targetImg);
  $(".create-fight-page,.user-info-page,.bet-page,.ready-page,.tv-dui-page,.fight-start-page").hide()
  $(".bet-page,body").show()

  $("#pink").data('name',data["fighterData"].sourcePedName);
  $("#green").data('name',data["fighterData"].targetPedName);


  $(".sourcebet").html(data["fighterData"].sourcePedName);
  $(".targetbet").html(data["fighterData"].targetPedName);
}

function requestPage(data) {
  myData = data["allData"]

  $(".pinkimg").attr("src",myData.sourceImg);
  $(".greenimg").attr("src",myData.targetImg);
  
  $(".sourceusername").html(myData.targetPedName)
  $(".targetusername").html(myData.sourcePedName)

  $(".round-info").html(myData.roundCount + "ROUND - " + myData.roundTime + "SEC")


  $(".create-fight-page,.user-info-page,.bet-page,.ready-page,.tv-dui-page").hide()
  $(".ready-page").show()
  $(".ready-main-box").animate({
    left: "85rem"
  }, 500)
}

$(document).on('click','.select',function (e) {
  betType = $(this).text();
  $(".bet").attr("placeholder", betType);
})

$(document).on('click', '.ready-button', function (e) {
  $.post(`http://frkn-fight/requestStatus`, JSON.stringify({bool:true }), function (x) {})
  close()
})

$(document).on('click', '.reject-button', function (e) {
  $.post(`http://frkn-fight/requestStatus`, JSON.stringify({bool:false }), function (x) {})
  close()
})




$(document).on('click', '.fighters-item', function (e) {
  playerId = $(this).data("id")
})


function close() {
  $("body").hide()
  $(".user-info-page").hide()
  $(".create-fight-page, .bet-page , .ready-page , .tv-dui-page").hide()
}


var startTextAnimation = $('#startText').css('animation');

function startTextAnimationCallback() {
  //console.log("fadeInStartText animasyonu tamamlandı");
}


var counterValue = 0;

function startFadeInStartTextAnimation() {
  var startTextElement = $('#startText');
  if (!startTextElement.data('animationStarted')) {
    startTextElement.css('animation', 'none');
    setTimeout(function () {
      startTextElement.css('animation', startTextAnimation);
      startTextElement.data('animationStarted', true);
    }, 0);
  }
  setTimeout(() => {
    $(".starter").fadeOut(1500);
    $(".fight-start-page").fadeIn(500);
    startTextElement.hide();
    
    
  }, 5000);
}


$(document).on('keydown', function () {
  switch (event.keyCode) {
    case 27:
      close()
      $.post(`http://frkn-fight/close`, JSON.stringify({}), function (x) {})
      break;
  }
});
