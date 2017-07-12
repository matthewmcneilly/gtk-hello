const string GETTEXT_PACKAGE = "...";

int main (string[] args) {
    Gtk.init (ref args);
    var window = new Gtk.Window ();
    window.title = _("Hello World, look at my grid!");
    window.set_border_width (12);
    window.set_position (Gtk.WindowPosition.CENTER);
    window.set_default_size (350, 70);
    window.destroy.connect (Gtk.main_quit);

    // Creates a grid
    var grid = new Gtk.Grid ();
    // Changes orientation from the default of horizonal to vertical
    // Anything added to the grid will be stacked vertically
    grid.orientation = Gtk.Orientation.VERTICAL;
    // Add some more spacing between rows
    grid.row_spacing = 6;
    // Would work if we had horizonal orientation to space the widgets
    grid.column_spacing = 6;


    // First portion - defines the UI
    // Creates button widget with a label child widget
    var button = new Gtk.Button.with_label ("Click me!");
    // Create a new seperate label
    var label = new Gtk.Label (null);

    // Add button to grid
    grid.add (button);
    grid.add (label);

    // Add grid to the window
    window.add (grid);

    // Second portion - defines the functions associated with the UI
    // Good practice to seperate this code under window.add
    // Useful when you start using different methods to change widget properties
    // Function runs when button is clicked and changes labels text
    button.clicked.connect (() => {
      label.label = _("Hello World!");
      // No longer does anything after first button click
      button.sensitive = false;
    });


    window.show_all ();
    Gtk.main ();
    return 0;
}
