const string GETTEXT_PACKAGE = "...";

public class MyApp : Gtk.Application {

  public MyApp () {
    Object (application_id: "com.github.matthewmcneilly.gtk-hello",
    flags: ApplicationFlags.FLAGS_NONE);
  }

  protected override void activate () {
    var app_window = new Gtk.ApplicationWindow (this);

    var grid = new Gtk.Grid ();
    grid.orientation = Gtk.Orientation.VERTICAL;
    grid.row_spacing = 6;

    var title_label = new Gtk.Label (_("Notifications"));
    var show_button = new Gtk.Button.with_label (_("Show"));
    var replace_button = new Gtk.Button.with_label (_("Replace"));

    grid.add (title_label);
    grid.add (show_button);
    grid.add (replace_button);

    app_window.add (grid);

    show_button.clicked.connect (() => {
      // When button clicked create a notification
      var notification = new Notification (_("Hello World"));
      // Create a notification image
      var image = new Gtk.Image.from_icon_name ("dialog-warning", Gtk.IconSize.DIALOG);
      // Set image to notification
      notification.set_icon (image.gicon);
      // Use gtk3-icon-browser to see what icons are available
      // Give notification a body description
      // And push the notification to the user
      notification.set_body (_("This is my first notification!"));
      this.send_notification ("notify.app", notification);
    });

    // should change notification when button clicked
    // but creates new notification
    replace_button.clicked.connect (() => {
        var notification = new Notification (_("Hello Again"));
        notification.set_body (_("This is my second Notification!"));

        var image = new Gtk.Image.from_icon_name ("dialog-warning", Gtk.IconSize.DIALOG);
        notification.set_icon (image.gicon);

        // Set notification as URGENT
        // Means user needs to interact with it or app retracts it for it to dissapear
        notification.set_priority (NotificationPriority.URGENT);
        this.send_notification ("com.github.matthewmcneilly.gtk-hello", notification);
    });

    app_window.show_all ();

    app_window.show ();
  }

  public static int main (string[] args) {
    var app = new MyApp ();
    return app.run (args);
  }
}
