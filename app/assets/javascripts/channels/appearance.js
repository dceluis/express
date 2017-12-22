App.appearance = App.cable.subscriptions.create({
  channel: "AppearanceChannel"
},{
  connected: function () {},

  disconnected: function () {},

  received: function (data) {
    appearances = document.querySelectorAll("[data-user-appearance]")

    for(var i = 0 ; i < appearances.length ; i++ ) {
      let appearance = appearances[i];
      if(data['online'].indexOf(appearance.dataset.userAppearance) == -1)
        appearance && (appearance.style = 'display: none;');
      else
        appearance && (appearance.style = '');
    }
  }
})
