if test -n "$ASDF_DATA_DIR" -a -d "$ASDF_DATA_DIR"
    source $ASDF_DATA_DIR/asdf.fish
else if test -f ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end
