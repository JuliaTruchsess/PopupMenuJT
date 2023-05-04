#tag Window
Begin Window DemoWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   604
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   868466687
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "PopupMenuJT Demo"
   Type            =   0
   Visible         =   True
   Width           =   860
   Begin PopupMenuJT pum1
      AllowAutoDeactivate=   False
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   35
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   98
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Margin          =   10
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   367
      Transparent     =   False
      Visible         =   True
      Width           =   295
   End
   Begin Label Label3
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Xojo PopUpMenu"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   322
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
   End
   Begin PopupMenu pumXojo
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Arial"
      FontSize        =   24.0
      FontUnit        =   0
      Height          =   45
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   357
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   256
   End
   Begin PopupMenu pumFonts
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   164
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   64
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   181
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   104
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Font"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin Label Label2
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   390
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Menu Size"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   61
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   68
   End
   Begin TextField FldSize
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   472
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   61
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   58
   End
   Begin CheckBox cbBold
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Bold"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   104
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   70
   End
   Begin DesktopColorPicker ColorPicker1
      HasAlpha        =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin BevelButton btnTextColor
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Text Color"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   354
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   False
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   123
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   82
   End
   Begin BevelButton btnBackgroundColor
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Background Color"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   448
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   False
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   123
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   131
   End
   Begin TextField FldRowSpace
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   270
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   123
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   62
   End
   Begin Label Label4
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Row Spacing"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   125
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   Begin CheckBox cbFlicker
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Wink"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   104
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   59
   End
   Begin CheckBox cbShowPic
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Show Picture"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   112
   End
   Begin CheckBox cbCloseOnExit
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Close On Exit"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   112
   End
   Begin TextField FldControlSize
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   61
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   58
   End
   Begin Label Label5
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   546
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Control Size"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   61
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   79
   End
   Begin Label Label6
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   168
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "PopupMenuJT"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   322
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin CheckBox cbCheckmark
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Checkmark"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   194
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   111
   End
   Begin BevelButton btnBHighlightColor
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Highlight Color"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   591
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   False
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   123
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   131
   End
   Begin CheckBox cbControlBackground
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Control Has Background"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   448
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   157
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   184
   End
   BeginSegmentedButton SegmentedButton SegmentedButton1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   301
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      Segments        =   "Alpha\n\nFalse\rNum\n\nFalse\rText\n\nFalse"
      SelectionStyle  =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   265
      Transparent     =   False
      Visible         =   True
      Width           =   176
   End
   Begin Container2 Container21
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   140
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   228
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   433
      Transparent     =   True
      Visible         =   True
      Width           =   342
   End
   Begin Label Label7
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "<- Nested in containers"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   491
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   195
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  left = screen(0).AvailableWidth/2 - Width/2
		  top = Screen(0).AvailableHeight/2 -Height/2
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GenerateSampleList(Mode As Integer) As String()
		  Dim List() As String
		  Dim f as FolderItem = SpecialFolder.Temporary
		  
		  
		  Select Case Mode
		  Case 0
		    for i as Integer = 65 to 90
		      list.AddRow Chr(i)
		    Next
		  Case 1
		    for i as Integer = 0 to 49
		      list.AddRow (Str(i))
		    Next
		  Case 2
		    
		    For each child As FolderItem in f.Children
		      List.AddRow child.Name
		      If list.Count > 50 then Exit
		    Next
		    
		  End Select
		  
		  
		  Return List
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ColorTarget As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastSelectedColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		pw As PicWindow
	#tag EndProperty


#tag EndWindowCode

#tag Events pum1
	#tag Event
		Sub Open()
		  
		  'me.AddAllRows Array("January", "February", "March", "April April April April April", "May", "June", "July", "August", "September", "October", "November", "December")
		  
		  Dim list() As String = GenerateSampleList(0)
		  
		  for i as Integer = 0 to list.LastRowIndex
		    me.Addrow(list(i),Aria)
		  next
		  
		  me.SelectedRowIndex = 0
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(MenuTop As Integer) As Boolean
		  If pw <> Nil Then pw.Close
		  if cbShowPic.Value Then
		    pw = new PicWindow
		    pw.Left = me.Left + me.TrueWindow.Left - pw.Width -20
		    pw.top = me.Top + me.TrueWindow.top- pw.Height/2
		    pw.ShowPic(me.RowTagAt(me.SelectedRowIndex))
		  End
		End Function
	#tag EndEvent
	#tag Event
		Sub MenuClosed(wasCancelled as boolean)
		  If pw <> Nil Then pw.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pumXojo
	#tag Event
		Sub Change()
		  If pw <> Nil Then pw.Close
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  'PicWindow.Close // This causes silent crash (quit) under Windows because LostFocus fires when you click the control
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if cbShowPic.Value Then
		    pw = new PicWindow
		    pw.Left = me.Left + me.TrueWindow.Left - pw.Width -20
		    pw.top = me.Top + me.TrueWindow.top- pw.Height/2
		    pw.ShowPic(Aria)
		  End
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  'PicWindow.Close // Under Windows this fires when you try to select an option, i.e. move outside the unexpanded control
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim list() As String = GenerateSampleList(0)
		  
		  for i as Integer = 0 to list.LastRowIndex
		    me.Addrow(list(i))
		  next
		  
		  me.SelectedRowIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pumFonts
	#tag Event
		Sub Change()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).FontName = me.SelectedRow
		  Next
		  
		  pumXojo.FontName = me.SelectedRow
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  For i As integer = 0 To System.FontCount - 1
		    me.addrow System.FontAt(i) 
		  Next
		  
		  me.SelectRowWithValue("Arial")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FldSize
	#tag Event
		Sub LostFocus()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).MenuFontSize = Val(me.Text)
		  Next
		  
		  pumXojo.FontSize = Val(me.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Text = Str(pum1.MenuFontSize)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbBold
	#tag Event
		Sub Action()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).Bold = me.Value
		  Next
		  pumXojo.Bold = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorPicker1
	#tag Event
		Sub Closed()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorSelected(selectedColor As Color)
		  LastSelectedColor = selectedColor
		  
		  Select Case ColorTarget
		  Case "Text"
		    For each c As Control in Controls
		      If c IsA PopupMenuJT Then PopupMenuJT(c).TextColor = selectedColor
		    Next
		    
		  Case "Background"
		    
		    For each c As Control in Controls
		      If c IsA PopupMenuJT Then PopupMenuJT(c).BckgndColor = selectedColor
		    Next
		    
		  Case "Highlight"
		    For each c As Control in Controls
		      If c IsA PopupMenuJT Then PopupMenuJT(c).HighlightColor = selectedColor
		    Next
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnTextColor
	#tag Event
		Sub Action()
		  ColorTarget = "Text"
		  ColorPicker1.Show(lastSelectedColor,"Select Color")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnBackgroundColor
	#tag Event
		Sub Action()
		  ColorTarget = "Background"
		  ColorPicker1.Show(LastSelectedColor,"Select Color")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FldRowSpace
	#tag Event
		Sub LostFocus()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).RowSpacing = Val(me.Text)
		  Next
		  
		  Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Text = Str(pum1.RowSpacing)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbFlicker
	#tag Event
		Sub Action()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).WinkOnAction = me.Value
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbCloseOnExit
	#tag Event
		Sub Action()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).CloseOnExit = me.Value
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FldControlSize
	#tag Event
		Sub LostFocus()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).ControlFontSize = Val(me.Text)
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Text = Str(pum1.ControlFontSize)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbCheckmark
	#tag Event
		Sub Action()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).ShowPreviousSelection = me.Value
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnBHighlightColor
	#tag Event
		Sub Action()
		  ColorTarget = "Highlight"
		  ColorPicker1.Show(LastSelectedColor,"Select Color")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbControlBackground
	#tag Event
		Sub Action()
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then PopupMenuJT(c).ControlHasBackground = me.Value
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedButton1
	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  
		  For each c As Control in Controls
		    If c IsA PopupMenuJT Then
		      PopupMenuJT(c).RemoveAllRows
		      PopupMenuJT(c).AddAllRows(GenerateSampleList(segmentindex))
		      PopupMenuJT(c).SelectedRowIndex = 0
		    ElseIf c isA PopupMenu and c.Name <> "pumfonts" Then
		      PopupMenu(c).RemoveAllRows
		      PopupMenu(c).AddAllRows(GenerateSampleList(segmentindex))
		      PopupMenu(c).SelectedRowIndex = 0
		    End
		  Next
		  
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
