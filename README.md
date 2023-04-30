# PopupMenuJT
## A cross-platform Xojo PopupMenu control

## Features

* Control height can be adjusted, unlike Xojo's Mac control
* Incremental search and arrow keys work when control has focus, unlike Xojo's Mac control
* Under Windows, menu behavior is more Mac-like than the Xojo control, e.g. it doesn't have a scrollbar.
* Optionally adds the Mac "wink" user feedback visual effect to Windows
* Independently-settable font size for base control and menu
* Settable background and highlight colors
* Settable text color
* Settable row spacing
* Option to apply background color to the base control as well as to the menu
* Optional (Mac-like) checkmark to indicate currently-selected item
* Easily customizable for individual needs
* Written entirely in Xojo, uses no declares or plugins
* Supports most of the Xojo control's methods and events, any missing ones can be easily added
* Supports nesting in ContainerControls
* Setting to close the popup on deactivation (normal behavior) or on mouse exit, which can be useful in some circumstances, e.g. when it is desired to activate another window in the MouseDown event.
* Written in Xojo API1

## Methods

Note many of the method pairs below could (should?) be changed to properties so they can be set in the Inspector.

AddAllRows(Items() as String)

AddRow(Value as String, Tag as Variant = nil)

AddRowAt(Index as Integer, Item as String, Tag as Variant = nil)

BckgndColor as Color

BckgndColor(assigns value as Color)

Bold as Boolean

Bold(assigns value as Boolean)

CloseOnExit as Boolean

CloseOnExit(assigns value as Boolean)

ControlFontSize as Integer

ControlFontSize(assigns value as Integer)

ControlHasBackground as Boolean

ControlHasBackground(assigns value as Boolean)

FontName as String

FontName(assigns value as String)

HighlightColor as Color

HighlightColor(assigns value as Color)

LastRowIndex as Integer

MenuFontSize as Integer

MenuFontSize(assigns value as Integer)

RemoveAllRows

RowSpacing as Integer

RowSpacing(assigns value as Integer)

RowTagAt(index as Integer) as Variant

RowTagAt(index as Integer, assigns value as Variant)

RowValueAt(index as Integer) as String

RowValueAt(index as Integer, assigns value as String)

SelectedRow as String

SelectedRow(assigns tag as Variant)

SelectedRow(assigns value as String)

*Note that assigning a value or tag with SelectedRow will set the current index to the first row matching the passed string. If the string is not found, no change will occur (unlike the Xojo control, which raises an exception using SelectRowWithValue or SelectRowWithTag).

ShowPreviousSelection as Boolean

ShowPreviousSelection(assigns value as Boolean)

TextColor as Color
TextColor(assigns value as Color)

WinkOnAction(assigns value as Boolean)


## Events

AnyChange

MenuClosed

MenuOpen (not implemented)

MouseDown(MenuTop as Integer) as Boolean

ProgrammaticChange

Selected

*Note that the distinct events for Programmatic, User ("Selected") and AnyChange may not actually be fully implemented yet.

## Components and Installation

Because the control uses a Window to display the popup menu, it cannot be encapsulated in one class. The control is comprised of

* PopupMenuJT - the "base control", a subclass of Canvas
* PopupWindow - a Plain Box window containing a canvas, which displays the menu
* PopupJTModule - a module containing methods and constants
* Images for scroll arrows, menu arrow, and checkmark

To add to a new project, drag or copy-paste the PopupMenuJT Components folder from the demo project into the new project's Navigator pane in the Xojo IDE.

## Limitations, Bugs, Caveats, To-Dos

- Multi-monitor support has been tested only with side-by-side monitors of the same resolution. May need work in order to support over-under stacked modules.
- No Dark Mode support

ToDo:

- Make row height / spacing adaptive/automatic from font size?
- Separate events for user and programmatic actions
- Shading on hover, like Windows?

Unimplemented Xojo/native control features

- Separators
- Drop object
- Scroll acceleration