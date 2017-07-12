const string GETTEXT_PACKAGE = "...";

int main (string[] args) {
    Gtk.init (ref args);
    var window = new Gtk.Window ();
    window.title = _("Hello World, look at my grid!");
    window.set_border_width (12);
    window.set_position (Gtk.WindowPosition.CENTER);
    window.set_default_size (350, 70);
    window.destroy.connect (Gtk.main_quit);

    // Create grid and set column and row spacing
    var layout = new Gtk.Grid ();
    layout.column_spacing = 6;
    layout.row_spacing = 6;

    var hello_button = new Gtk.Button.with_label (_("Say Hello"));
    var hello_label = new Gtk.Label (null);

    var rotate_button = new Gtk.Button.with_label (_("Rotate"));
    var rotate_label = new Gtk.Label (_("Horizonal"));

    /*
    Notice that the attach method takes 5 arguments:
      The widget that you want to attach to the grid.
      The column number to attach to starting at 0.
      The row number to attach to starting at 0.
      The number of columns the widget should span.
      The number of rows the widget should span.
    */
    layout.attach (hello_button, 0, 0, 1, 1);
    layout.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);
    layout.attach (rotate_button, 0, 1, 1, 1);
    layout.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

    window.add (layout);

    // Change label text when button clicked
    hello_button.clicked.connect (() => {
      hello_label.label = _("Hello World!");
      hello_button.sensitive = false;
    });

    // Rotate label and change text when button clicked
    rotate_button.clicked.connect (() => {
      rotate_label.angle = 90;
      rotate_label.label = _("Vertical");
      rotate_button.sensitive = false;
    });

    window.show_all ();
    Gtk.main ();
    return 0;
}
