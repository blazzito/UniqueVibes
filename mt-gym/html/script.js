window.addEventListener('message', function (event) {
  let data = event.data;

  if (data.action === "open") {
    let SkillTypes = data.skilltypes;
    let Skills = data.skills;

    $(`.skills-list`).html("");

    for (let key in SkillTypes) {
      if (SkillTypes[key].Use) {
        let value = Skills[key] || 0;
        let label = SkillTypes[key].Label;
        let color = SkillTypes[key].Color || 'var(--primary-red)';

        $(`.skills-list`).append(`
                    <div class="skill-item">
                        <div class="skill-info">
                            <span class="skill-name">${label}</span>
                            <span class="skill-value" style="color: ${color}">${value}%</span>
                        </div>
                        <div class="skill-progress-bg">
                            <div class="skill-progress-fill" style="width: ${value}%; background-color: ${color}"></div>
                        </div>
                    </div>
                `);
      }
    }

    $(".section-main").addClass("show");
    setTimeout(() => {
      $(".section-main").css("opacity", "1");
    }, 10);
  }
  else if (data.action === "StartTimer") {
    let time = data.time;
    $(".section-timer").addClass("show");
    $(".section-timer").css("opacity", "1");

    function updateTimer() {
      if (time > 0) {
        $("#timer-val").text(fancyTimeFormat(time));
        if (time < 10) {
          $(".timer-card").css("background", "var(--gym-red)");
          $(".timer-card").css("border-color", "var(--white)");
        } else {
          $(".timer-card").css("background", "var(--dark)");
          $(".timer-card").css("border-color", "var(--gym-red)");
        }
        time--;
        setTimeout(updateTimer, 1000);
      } else {
        CloseTimer();
      }
    }
    updateTimer();
  }
  else if (data.action === "StopTimer") {
    CloseTimer();
  }
  else if (data.action === "Notify") {
    let Skill = data.skillname;
    let label = data.skilltypes[Skill].Label;
    let value = data.skillvalue;

    $("#notify-text").text(`+${value} ${label}`);
    $(".section-notify").addClass("show");
    $(".section-notify").css("opacity", "1");

    setTimeout(() => {
      $(".section-notify").css("opacity", "0");
      setTimeout(() => {
        $(".section-notify").removeClass("show");
      }, 400);
    }, data.duration || 5000);
  }
});

function fancyTimeFormat(duration) {
  var mins = ~~((duration % 3600) / 60);
  var secs = ~~duration % 60;
  return (mins < 10 ? "0" : "") + mins + ":" + (secs < 10 ? "0" : "") + secs;
}

function Close() {
  $(".section-main").css("opacity", "0");
  setTimeout(() => {
    $(".section-main").removeClass("show");
    $.post('https://' + GetParentResourceName() + '/UseButton', JSON.stringify({ action: "close" }));
  }, 400);
}

function CloseTimer() {
  $(".section-timer").css("opacity", "0");
  setTimeout(() => {
    $(".section-timer").removeClass("show");
  }, 400);
}

document.onkeyup = function (event) {
  if (event.key === 'Escape') {
    Close();
  }
};
