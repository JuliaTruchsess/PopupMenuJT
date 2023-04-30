#tag Window
Begin Window PopupWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   400
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Untitled"
   Type            =   4
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer tmrMouseTracking
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   "#kMouseCheckInterval"
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Deactivate()
		  If not Source.CloseOnExit Then
		    mMouseIndex = -1
		    close
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Dim row As Integer = Source.SelectedRowIndex
		  
		  Select Case Asc(key)
		  Case 27 // Escape
		    mMouseIndex = -1
		    Close
		    Return True
		  Case 3, 10, 13 // Enter, LF, CR
		    Close
		    Return True
		    
		    // Highlight position when menu is open is independent of both SelectedRowIndex and MouseIndex, so needs its own index property HighlightedRow.
		  Case 28, 30 // Left & up arrows
		    HighlightedRow = Max(0,HighlightedRow-1)
		    row = HighlightedRow
		  Case 29, 31  // Right & down arrows
		    HighlightedRow = Min(rows.LastRowIndex, HighlightedRow + 1)
		    row = HighlightedRow
		    
		    // Keyboard search
		  Case Else
		    timer.CancelCallLater AddressOf ClearSearch
		    timer.CallLater kSearchTimeoutMs, AddressOf ClearSearch
		    
		    SearchString = SearchString+key
		    
		    For row = 0 to rows.LastRowIndex
		      if rows(row).Left(SearchString.Length) = SearchString Then // Found it
		        HighlightedRow = row
		        Exit
		      End
		    Next
		    
		  End Select
		  
		  
		  // Bring the row found by search or scrolled to with arrow keys into the view window
		  
		  If row < ScrollIndex - RowsAbove +1  Then // It's off the top
		    ScrollIndex = RowsAbove + row // Put it at the top
		    SetHeight
		    mMouseIndex = 0
		  Elseif row >= ScrollIndex + RowsBelow Then // It's below the bottom
		    ScrollIndex = row - RowsBelow + 1 // Put it at the bottom
		    SetHeight
		    mMouseIndex = RowsBelow + RowsAbove - 1
		    PrevMouseY = System.MouseY - me.top
		  Else
		    mMouseIndex = row - FirstIndex
		  End
		  Refresh
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  DoAction
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckDrag()
		  if system.MouseDown Then Dragging = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSearch()
		  SearchString = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoAction()
		  tmrMouseTracking.Enabled = False // We're done
		  
		  if not mWinkOnAction Then
		    Close
		  Else
		    Wink = True // Turn highlight off briefly, i.e. "wink"
		    Refresh
		    timer.CallLater kWinkOffTime, AddressOf WinkOn // WinkOn will turn highlight back on for a time before closing the popup
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoScroll()
		  // Once we hit the bottom or top we don't shrink
		  
		  Dim newscroll As Integer
		  
		  if ScrollUp Then
		    newscroll = ScrollIndex + 1
		  ElseIf ScrollDown Then
		    newscroll = ScrollIndex - 1
		  End
		  
		  If newscroll <= rows.Count-RowsBelow and newscroll >= RowsAbove  Then
		    ScrollIndex = newscroll
		    SetHeight
		    Refresh
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleMouseMove(Y as Integer)
		  // Called by timer instead of MouseMove so we can implement dragging.
		  
		  mMouseIndex = Min(Y/RowHeight - UpArrow.Height/RowHeight,rows.LastRowIndex) // ## Corrected for outofbounds 4/22/23
		  HighlightedRow = mMouseIndex + FirstIndex
		  
		  If HasBottomArrow and Y > (Height - DownArrow.Height) Then
		    ScrollUp = True
		  Else
		    ScrollUp = False
		  End
		  
		  If HasTopArrow and Y < UpArrow.Height Then
		    ScrollDown = True
		  Else
		    ScrollDown = False
		  End
		  
		  Scrolling = ScrollUp or ScrollDown
		  
		  me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Popup(Source As PopupMenuJT, Rows() As String, RowHeight As Integer) As Integer
		  me.Source = Source
		  me.rows = Rows
		  me.RowHeight = RowHeight
		  me.mBackColor = Source.BckgndColor
		  me.margin = Source.Margin
		  mWinkOnAction = Source.WinkOnAction
		  ShowPreviousSelection = Source.ShowPreviousSelection
		  
		  SearchString = ""
		  
		  top = Source.TrueTop
		  
		  // Popup must be constrained to the smallest screen height available, in case it straddles a screen boundary.
		  Dim AvailHeight, AvailTop As Integer
		  AvailHeight = Min(Screen(LeftSideScreenIndex).AvailableHeight,Screen(RightSideScreenIndex).AvailableHeight)
		  AvailTop = Min(Screen(LeftSideScreenIndex).AvailableTop,Screen(RightSideScreenIndex).AvailableTop)
		  
		  AvailableRowsAbove = (top - AvailTop - UpArrow.Height) / RowHeight
		  
		  // AvailableHeight allows for both top and bottom menu/taskbar/dock, so we have to add AvailableTop to AvailableHeight to get only the space below.
		  AvailableRowsBelow =  (AvailHeight +AvailTop - top - DownArrow.Height) / RowHeight
		  
		  // Initialize
		  ScrollIndex = source.SelectedRowIndex // Center popup on selected row. ScrollIndex is the list index of the item displayed at the main control's position.
		  SetHeight
		  HandleMouseMove(Canvas1.MouseY)
		  
		  // # Setting Top seems to affect Left somehow, so do left _after_ top & height stuff
		  
		  Self.Left = Source.TrueLeft
		  LeftSideScreenIndex = WhichScreen(Left, Top) // Screen index of base control's left top corner
		  RightSideScreenIndex = WhichScreen(Left + Source.Width, Top) // Screen index of base control's right top corner
		  
		  // If we're to the left of the left edge of the leftmost screen we need to reposition to just right of the left edge. Since left alignment is independent of menu content
		  // we can do this here instead of in the Paint event.
		  If LeftmostScreen(Left+Width) and Screen(RightSideScreenIndex).AvailableLeft > Self.Left Then
		    Self.Left = Screen(RightSideScreenIndex).AvailableLeft + 5
		  End
		  
		  // If mouse is down at the end of kDragTime then we conclude we're dragging. If kDragTime is too short, menu may close prematurely on initial click.
		  timer.CallLater kDragTime,AddressOf CheckDrag
		  
		  ShowModal
		  
		  Return mMouseIndex + FirstIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetHeight()
		  // Resize the height of the popup window depending on the state of the scrolled menu.
		  
		  // We always size the window to include space for up & down arrows whether we draw them or not - resizing for the arrows
		  // (as the native Mac control does) is just too much of a pain. HasTopArrow and HasBottomArrow only control drawing in the Paint event.
		  
		  // A ScrollIndex  of 0 means that the first element of Rows is located at the main control's location.
		  // "Above" and "Below" are referenced to the main control's Top, e.g. if rowcount = 10 and ScrollIndex = 9, there's one row "below".
		  
		  HasBottomArrow = (Rows.Count - ScrollIndex ) > AvailableRowsBelow  // Set bottom scroller
		  
		  If not HasTopArrow Then // Once we hit the top we don't shrink again so don't bother executing this code
		    If ScrollIndex > AvailableRowsAbove Then // Draw arrow at the top
		      HasTopArrow = True
		      Top =  Source.TrueTop - AvailableRowsAbove * RowHeight  - UpArrow.Height
		    Else
		      Top =  Source.TrueTop - ScrollIndex * RowHeight- UpArrow.Height
		    End
		  End
		  
		  // Remove arrow if fully scrolled
		  If HasTopArrow and ScrollIndex <= AvailableRowsAbove then HasTopArrow = False
		  
		  RowsBelow = Min(AvailableRowsBelow, Rows.Count - ScrollIndex )
		  RowsAbove = Min(AvailableRowsAbove, ScrollIndex)
		  
		  // First and LastIndex are the indices of the first and last elements of Rows to be displayed in the list
		  FirstIndex = ScrollIndex - RowsAbove
		  LastIndex = ScrollIndex + RowsBelow -1
		  
		  Height = RowHeight * (RowsAbove + RowsBelow) + 2 * uparrow.Height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WinkFinish()
		  // Done winking
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WinkOn()
		  // Turn highlight back on again after winking off
		  
		  Wink = False
		  Refresh
		  timer.CallLater kWinkOnTime, AddressOf WinkFinish // WinkFinish will just close the popup window
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private AdjustedWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AvailableRowsAbove As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AvailableRowsBelow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CheckPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Dragging As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FirstIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HasBottomArrow As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HasTopArrow As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HighlightedRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LeftSideScreenIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private margin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseIn As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWinkOnAction As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrevMouseX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrevMouseY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RightSideScreenIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RowHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private rows() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RowsAbove As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RowsBelow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Scrolling As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollUp As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SearchString As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ShowPreviousSelection As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Source As PopupMenuJT
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Wink As Boolean
	#tag EndProperty


	#tag Constant, Name = kDragTime, Type = Double, Dynamic = False, Default = \"250", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMouseCheckInterval, Type = Double, Dynamic = False, Default = \"50 // Note that scroll interval is a fixed multiple of this interval", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kScrollMultiple, Type = Double, Dynamic = False, Default = \"2 // In units of kMouseCheckInterval", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWinkOffTime, Type = Double, Dynamic = False, Default = \"50", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWinkOnTime, Type = Double, Dynamic = False, Default = \"100", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.PenSize = 1
		  g.FontName = source.FontName
		  g.FontSize = source.MenuFontSize
		  g.Bold = source.Bold
		  
		  g.ForeColor = mBackColor
		  g.FillRectangle 0,0,me.Width,me.Height
		  
		  AdjustedWidth = 0
		  for row As integer = 0 to rows.LastRowIndex
		    if g.TextWidth(rows(row)) + 2*Margin > AdjustedWidth Then
		      AdjustedWidth = g.TextWidth(rows(row)) + 2*Margin
		    End
		  Next
		  
		  // Pre-size the checkmark picture to simplify drawing code. Checkmark size is determined by font size.
		  If ShowPreviousSelection then 
		    checkpic = new Picture(checkmark.Width*g.FontAscent/checkmark.Height,RowHeight)
		    checkpic.Graphics.DrawPicture(checkmark,0,(RowHeight-g.FontAscent)/2,checkpic.Width,g.FontAscent,0,0,checkmark.Width,checkmark.Height)
		    AdjustedWidth = AdjustedWidth + checkpic.Width
		  End
		  
		  Self.Width = Max(AdjustedWidth,Source.Width)
		  
		  // See if we need to shift the popup left due to lack of space.
		  
		  If RightmostScreen(Source.TrueLeft) Then
		    If Screen(RightSideScreenIndex).AvailableLeft + Screen(RightSideScreenIndex).AvailableWidth - Source.TrueLeft < Self.Width Then // Not enough room on the right, need to shift left
		      Self.Left = Screen(RightSideScreenIndex).AvailableLeft + Screen(RightSideScreenIndex).AvailableWidth - Self.Width - 5
		    End
		  End
		  
		  Dim Topoffset As Integer = UpArrow.Height-2 // Subtracting 2 centers the highlight on the control
		  
		  // Draw the rows
		  
		  for row As integer = 0 to (RowsAbove+RowsBelow) -1
		    
		    // Highlight
		    If row = mMouseIndex and MouseIn and not Wink Then
		      If not ScrollIng Then // Highlighting causes flicker when we change Height in Resize, so inhibit.
		        g.ForeColor = Source.HighlightColor
		        g.FillRectangle(0,row*RowHeight + Topoffset,me.Width,RowHeight)
		        g.ForeColor = Color.White
		      End
		    Else
		      g.ForeColor = Source.TextColor
		    End
		    
		    // Draw checkmark and set left margin
		    dim adjustedmargin As Integer
		    If ShowPreviousSelection And CheckPic <> Nil Then
		      If  row + FirstIndex = Source.SelectedRowIndex Then
		        g.DrawPicture checkpic,Margin,row * RowHeight + Topoffset
		      End
		      adjustedmargin = margin + CheckPic.Width
		    Else
		      adjustedmargin = margin
		    End
		    
		    // Center the text vertically. May not be quite right for exotic fonts, depends on font metrics.
		    g.DrawText rows(row+FirstIndex), adjustedmargin, row*rowheight + RowHeight/2 + g.FontAscent/2 - (g.TextHeight-g.FontAscent)/2 + Topoffset
		    
		  Next
		  
		  // Draw scroll arrows if required
		  g.ForeColor = Color.Black
		  if HasBottomArrow then
		    g.DrawPicture DownArrow,(Width/2 - DownArrow.Width/2), Height-DownArrow.Height
		  End
		  If HasTopArrow then
		    g.DrawPicture UpArrow,(Width/2 - UpArrow.Width/2), 0
		  End
		  
		  // Rectangle around the list
		  g.DrawRectangle 0,0,me.Width,me.Height
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  Dim newscroll As Integer = ScrollIndex + DeltaY
		  
		  If newscroll <= rows.Count-RowsBelow and newscroll >= RowsAbove  Then
		    
		    ScrollIndex = newscroll
		    SetHeight
		    Refresh
		    
		  End
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tmrMouseTracking
	#tag Event
		Sub Action()
		  // We can't get click-and-drag action via MouseMove or MouseDrag because those events don't fire unless a MouseDown has returned True,
		  // and as the mousedown return of the main control is pending closure of this modal popup window, that can't work. We therefore
		  // implement our own event with a timer.
		  
		  Static ScrollTimer As Integer
		  
		  Try // Zombie timer can keep firing while window is closing or we might be in this handler while closing, so need to check for nils
		    
		    Dim Y as Integer
		    
		    If Canvas1 <> Nil then
		      Y = Canvas1.MouseY
		      
		      If Y <> PrevMouseY Then
		        PrevMouseY = Y
		        HandleMouseMove  Y
		      End
		      
		      
		      If (Dragging = True and not system.MouseDown) Then DoAction // MouseUp
		      
		      // Optimal scroll interval is ≈75ms, but if we set tmrMouseTracking's period near or less than that for responsive mouse tracking,
		      // a standard Xojo timer for scrolling will never fire. We therefore "share" tmrMouseTracking with scroll timing, with the limitation
		      // that scroll interval is necessarily an integer multiple of tmrMouseTracking's period
		      
		      If ScrollIng Then
		        ScrollTimer = ScrollTimer + 1
		        If ScrollTimer = kScrollMultiple Then // Scroll time is in units of tmrMouseTracking's period
		          ScrollTimer = 0
		          DoScroll
		        End
		      End 
		      
		      // MouseEnter and MouseExit may not fire since the timer is so active, so do those here, too.
		      If Canvas1 <> Nil Then
		        If System.MouseX < Canvas1.TrueLeft or System.MouseX > Canvas1.TrueLeft+Canvas1.Width or _
		          System.MouseY < Canvas1.TrueTop or System.MouseY > Canvas1.TrueTop+Canvas1.Height Then
		          If source.CloseOnExit Then
		            mMouseIndex = -1
		            close
		          Else
		            MouseIn = False
		            Refresh
		          End
		        Else
		          if not ScrollIng then 
		            MouseIn = True
		            Refresh
		          End
		        End
		      End
		    End
		  Catch Err As NilObjectException
		    // We're closing anyway so we can catch this and keep running.
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
