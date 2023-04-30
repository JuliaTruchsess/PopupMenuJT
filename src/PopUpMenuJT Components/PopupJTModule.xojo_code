#tag Module
Protected Module PopupJTModule
	#tag Method, Flags = &h0
		Function LeftmostScreen(X As Integer) As Boolean
		  // Returns true if the passed X is in the leftmost screen
		  
		  For i As Integer = 0 To Screen.LastScreenIndex
		    If Screen(i).AvailableLeft + Screen(i).AvailableWidth < X Then // Screen is left of X so X is not in the leftmost screen
		      Return False
		    End
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightmostScreen(X As Integer) As Boolean
		  // Returns true if the passed X is in the rightmost screen
		  
		  For i As Integer = 0 To Screen.LastScreenIndex
		    If Screen(i).AvailableLeft > X Then // Screen is right of X, so X is not in rightmost screen
		      Return False
		    End
		    
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueLeft(Extends Ctl As RectControl) As Integer
		  // Returns a RectControl's Left in display space regardless of how deeply nested it is in containers
		  
		  Dim CtlLeft As Integer = Ctl.Left
		  Dim parent As Object = Ctl.Parent
		  
		  While parent isA EmbeddedWindowControl
		    CtlLeft = CtlLeft + EmbeddedWindowControl(parent).Left
		    parent = EmbeddedWindowControl(parent).Parent
		  Wend
		  
		  Return CtlLeft + Ctl.TrueWindow.Left
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueTop(Extends Ctl As RectControl) As Integer
		  // Returns a RectControl's Top in display space regardless of how deeply nested it is in containers
		  
		  Dim CtlTop As Integer  = Ctl.top
		  Dim parent As Object = Ctl.Parent
		  
		  While parent isA EmbeddedWindowControl
		    CtlTop = CtlTop + EmbeddedWindowControl(parent).Top
		    parent = EmbeddedWindowControl(parent).Parent
		  Wend
		  
		  Return CtlTop + Ctl.TrueWindow.Top
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhichScreen(X As Integer, Y As Integer) As Integer
		  // https://forum.xojo.com/t/how-can-i-get-the-index-of-the-screen-my-window-is-on/75286/7
		  
		  Var oDisplay As Screen
		  
		  For i As Integer = 0 To Screen.LastScreenIndex
		    
		    oDisplay = Screen.ScreenAt(i)
		    
		    If x >= oDisplay.AvailableLeft And x <= oDisplay.AvailableWidth + oDisplay.AvailableLeft And _
		      y >= oDisplay.AvailableTop And y <= oDisplay.AvailableHeight + oDisplay.AvailableTop Then
		      
		      Return i
		      
		    End If
		    
		  Next
		End Function
	#tag EndMethod


	#tag Constant, Name = kSearchTimeoutMs, Type = Double, Dynamic = False, Default = \"1000", Scope = Public
	#tag EndConstant


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Module
#tag EndModule
