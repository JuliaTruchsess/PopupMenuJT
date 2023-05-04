#tag Class
Protected Class PopupMenuJT
Inherits Canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  // Need KeyDown handler in the base control for keyboard search when unexpanded.
		  
		  Select Case Asc(key)
		    
		  Case 28, 30 // Left & up arrows
		    SelectedRowIndex = Max(0, SelectedRowIndex - 1)
		  Case 29, 31  // Right & down arrows
		    SelectedRowIndex = Min(rows.LastRowIndex, SelectedRowIndex + 1)
		    
		  Case Else
		    timer.CancelCallLater AddressOf ClearSearch
		    timer.CallLater kSearchTimeoutMs, AddressOf ClearSearch
		    
		    SearchString = SearchString+key
		    
		    For row As Integer = 0 to rows.LastRowIndex
		      if rows(row).Left(SearchString.Length) = SearchString Then
		        SelectedRowIndex = Row
		        Exit
		      End
		    Next
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Me.SetFocus
		  
		  // If CloseOnExit is false, anything in the MouseDown event that deactivates the popup window, e.g. opening another window,
		  //  may cause the popup to deactivate and close immediately. Setting CloseOnExit to True prevents menu closure on
		  // deactivation and causes the menu to close on mouse exit instead.
		  
		  // In order to get the menu to display over all other controls and to extend beyond its window or ContainerControl,
		  // the menu must be displayed in a window. Our PopupWindow is a Plain Box since we don't want a title bar.
		  
		  // Make the popup
		  popup = new PopupWindow
		  popup.Width = me.Width
		  popup.Height = RowHeight * rows.Count
		  
		  call RaiseEvent MouseDown(popup.top) // # see Notes
		  
		  // Show popup window modally, it returns selected row index or -1 if no selection
		  Dim ReturnedIndex As Integer = popup.Popup(Me, Rows, RowHeight)
		  
		  RaiseEvent MenuClosed(ReturnedIndex < 0)
		  
		  If ReturnedIndex >= 0 then // User selected a row
		    mSelectedRowIndex = ReturnedIndex
		    mSelectedRow = Rows(mSelectedRowIndex)
		    RaiseEvent AnyChange
		    RaiseEvent Selected
		  End
		  
		  me.Refresh
		  
		  
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // This canvas only displays the first row. When the popup is activated, all rows
		  // are shown in the popup window's canvas.
		  
		  g.PenSize = 1
		  g.FontName = mFontName
		  g.FontSize = mControlFontSize
		  g.Bold = mBold
		  RowHeight = g.TextHeight+mRowSpacing
		  
		  If ControlHasBackground Then
		    g.ForeColor = mBackgroundColor
		  Else
		    g.ForeColor = Color.White
		  End
		  
		  g.FillRectangle 0,0,me.Width-MenuArrow.Width,me.Height
		  
		  g.ForeColor = mTextColor
		  
		  // Center the text vertically. May not be quite right for exotic fonts, depends on font metrics.
		  g.DrawText mSelectedRow,Margin,Height/2 + g.FontAscent/2 - (g.TextHeight-g.FontAscent)/2, me.Width-MenuArrow.Width-4,True // Leave extra width for ellipses
		  
		  // Clear rectangle for arrow
		  g.ForeColor = color.White
		  g.FillRectangle me.Width-MenuArrow.Width,0,MenuArrow.Width,me.Height
		  
		  // Draw arrow
		  g.DrawPicture(MenuArrow,me.Width-MenuArrow.Width,(me.Height-MenuArrow.Height)/2)
		  
		  // Draw rectangle around entire control
		  if TargetMacOS or (TargetWindows and me.TrueWindow.Focus = RectControl(me)) Then
		    g.ForeColor = &cD2D2D2
		    g.DrawRectangle 0,0,me.Width,me.Height
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddAllRows(Items() As String)
		  for each item As String in Items
		    Addrow item
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Addrow(Value As String, Tag As Variant = nil)
		  Rows.AddRow Value
		  RowTags.AddRow Tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRowAt(Index As Integer, Item As String, Tag As Variant = nil)
		  Rows.AddRowAt(Index, Item)
		  RowTags.AddRowAt(Index,Tag)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BckgndColor() As Color
		  return mBackgroundColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BckgndColor(assigns value as Color)
		  mBackgroundColor = value
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bold() As Boolean
		  return mBold
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bold(assigns value as Boolean)
		  mBold = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSearch()
		  SearchString = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloseOnExit() As Boolean
		  return mCloseOnExit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseOnExit(assigns value as Boolean)
		  mCloseOnExit = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlFontSize() As Integer
		  return mControlFontSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlFontSize(assigns value as Integer)
		  mControlFontSize = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlHasBackground() As Boolean
		  return mControlHasBackground
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlHasBackground(assigns value as Boolean)
		  mControlHasBackground = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CustomDrawn() As boolean
		  return IsEventImplemented("DrawRow")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRow(g as graphics, row as integer)
		  RaiseEvent DrawRow(g, row)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FontName() As String
		  return mFontName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FontName(assigns value as String)
		  mFontName = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HighlightColor() As Color
		  return mHighlightColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HighlightColor(assigns value as Color)
		  mHighlightColor = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastRowIndex() As Integer
		  Return Rows.LastRowIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuFontSize() As Integer
		  return mMenuFontSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MenuFontSize(assigns value as Integer)
		  mMenuFontSize = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllRows()
		  Rows.RemoveAllRows
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowSpacing() As Integer
		  return mRowSpacing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowSpacing(assigns value as Integer)
		  mRowSpacing = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTagAt(Row As Integer) As Variant
		  Return RowTags(Row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTagAt(row as Integer, Assigns Value as Variant)
		  RowTags(row) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowValueAt(Index As Integer) As String
		  Return Rows(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowValueAt(Index As Integer, Assigns Value As String)
		  Rows(Index) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRow() As String
		  Return mSelectedRow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRow(Assigns Value As String)
		  if rows.IndexOf(Value) >= 0 Then
		    SelectedRowIndex = Rows.IndexOf(Value)
		  End
		  
		  RaiseEvent AnyChange // ## Should this be inside the If/Then?
		  RaiseEvent ProgrammaticChange
		  
		  me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRow(Assigns Tag As Variant)
		  For index As Integer = 0 to RowTags.LastRowIndex
		    If Tag.Equals(RowTags(index)) Then
		      SelectedRowIndex = index
		      Exit
		    End
		  Next
		  
		  RaiseEvent AnyChange // ## Should this be inside the If/Then?
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRowIndex() As Integer
		  Return mSelectedRowIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRowIndex(Assigns Value As Integer)
		  If Value > -1 and Value < rows.Count Then
		    
		    mSelectedRowIndex = Value
		    mSelectedRow = rows(Value)
		    
		  Else
		    mSelectedRowIndex = -1
		    mSelectedRow = ""
		  End
		  
		  RaiseEvent AnyChange // ## Should this be inside the If/Then?
		  RaiseEvent ProgrammaticChange
		  
		  me.Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowPreviousSelection() As Boolean
		  return mShowCheckmark
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPreviousSelection(assigns value as Boolean)
		  mShowCheckmark = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextColor() As Color
		  return mTextColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextColor(assigns value as Color)
		  mTextColor = value
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WinkOnAction() As Boolean
		  return mWinkOnAction
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WinkOnAction(assigns value as Boolean)
		  mWinkOnAction = value
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AnyChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DrawRow(g as graphics, rowNumber as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuClosed(wasCancelled as boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuOpen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(MenuTop As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ProgrammaticChange()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Selected()
	#tag EndHook


	#tag Note, Name = General
		Bugs / Oddities / Limitations
		
		- Multi-monitor support has been tested only with side-by-side monitors of the same resolution.
		- No Dark Mode
		
		ToDo:
		
		- Make row height / spacing adaptive/automatic from font size?
		- Separate events for user and programmatic actions
		- Shading on hover, like Windows?
		
		Unimplemented Xojo control features
		
		- Separators
		- Drop object
		- Scroll acceleration
	#tag EndNote


	#tag Property, Flags = &h0
		Margin As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBackgroundColor As Color = &cFFFFFF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCloseOnExit As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mControlFontSize As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mControlHasBackground As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontName As String = """System"""
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlightColor As Color = &c6B9CF8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenuFontSize As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowSpacing As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedRow As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedRowIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowCheckmark As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWinkOnAction As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private popup As PopupWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RowHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Rows() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RowTags() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SearchString As String
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Margin"
			Visible=false
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
