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

    // Add labels to the grid
    grid.add (new Gtk.Label (_("Label 1")));
    grid.add (new Gtk.Label (_("Label 2")));

    // Add grid to the window
    window.add (grid);
    window.show_all ();
    Gtk.main ();
    return 0;
}
