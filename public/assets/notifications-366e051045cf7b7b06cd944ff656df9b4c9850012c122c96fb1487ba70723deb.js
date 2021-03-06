(function() {
  var Notifications,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Notifications = (function() {
    function Notifications() {
      this.handleSuccess = bind(this.handleSuccess, this);
      this.notifications = $("[data-behavior = 'notifications']");
      if (this.notifications.length > 0) {
        this.setup();
      }
    }

    Notifications.prototype.setup = function() {
      return $.ajax({
        url: '/notifications.json',
        dataType: 'JSON',
        method: 'GET',
        success: this.handleSuccess
      });
    };

    Notifications.prototype.handleSuccess = function(data) {
      var items;
      console.log(data);
      items = $.map(data, function(notification) {
        return "<a class='dropdown-item' href='" + notification.url + "'>" + notification.actor + " " + notification.action + " " + notification.notifiable.type + "</a>";
      });
      return $("[data-behavior = 'notifiaction-items']").html(items);
    };

    return Notifications;

  })();

  jQuery(function() {
    return new Notifications;
  });

}).call(this);
