VERSION 5.00
Begin VB.Form options_Fonts 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   ClientHeight    =   6720
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8295
   ControlBox      =   0   'False
   DrawStyle       =   5  'Transparent
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HasDC           =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   448
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   553
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin PhotoDemon.pdListBox lstFonts 
      Height          =   1695
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   2990
      Caption         =   "font folders:"
   End
   Begin PhotoDemon.pdLabel lblInfo 
      Height          =   735
      Index           =   0
      Left            =   120
      Top             =   2760
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   1296
      Alignment       =   2
      Caption         =   ""
      Layout          =   1
   End
   Begin PhotoDemon.pdDropDownFont ddFont 
      Height          =   855
      Left            =   0
      TabIndex        =   0
      Top             =   1800
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   1508
      Caption         =   "interface font"
   End
End
Attribute VB_Name = "options_Fonts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'***************************************************************************
'Tools > Options > Fonts panel
'Copyright 2025-2025 by Tanner Helland
'Created: 04/April/25
'Last updated: 04/April/25
'Last update: initial build
'
'This form contains a single subpanel worth of program options.  At run-time, it is dynamically
' made a child of FormOptions.  It will only be loaded if/when the user interacts with this category.
'
'All Tools > Options child panels must some mandatory public functions, including ones for loading
' and saving user preferences, as well as validating any UI elements where the user can enter
' custom values.  (A reset-style function is *not* required; this is automatically handled by
' FormOptions.)
'
'This form, like all Tools > Options panels, interacts heavily with the UserPrefs module.
' (That module is responsible for all low-level preference reading/writing.)
'
'Unless otherwise noted, all source code in this file is shared under a simplified BSD license.
' Full license details are available in the LICENSE.md file, or at https://photodemon.org/license/
'
'***************************************************************************

Option Explicit

Private Sub Form_Load()
    
    'Populate the font UI
    ddFont.InitializeFontList
    
    'Load all user font folders.  The default PD font folder is always available, but the user can add more.
    lstFonts.AddItem UserPrefs.GetFontPath(), 0, True
    
End Sub

Public Sub LoadUserPreferences()
    
    'Technically, the active font name comes from the font engine, *not* user prefs.
    ' Start there, but if there's a difference, default to the one in the user prefs file.
    ' (This would mean the user has changed the font this session, but *not* restarted the app.)
    Dim curFontName As String, curFontPref As String
    curFontName = Fonts.GetUIFontName()
    curFontPref = UserPrefs.GetUIFontName()
    
    Dim targetName As String
    If Strings.StringsEqual(curFontName, curFontPref, True) Then
        targetName = curFontName
    Else
        
        'The user prefs value will be NULL until the user interacts with it
        If (LenB(curFontPref) > 0) Then
            
            'If the font doesn't exist on this PC, revert to PD's default UI font
            Dim cFont As pdFont: Set cFont = New pdFont
            If cFont.DoesFontExist(curFontPref) Then
                targetName = curFontPref
            Else
                targetName = curFontName
            End If
        
        'Use PD's default font
        Else
            targetName = curFontName
        End If
    End If
    
    'Default to the most appropriate font
    ddFont.ListIndex = ddFont.ListIndexByString(targetName, vbTextCompare)
    
End Sub

Public Sub SaveUserPreferences()
    
    UserPrefs.SetPref_String "Interface", "UIFont", ddFont.List(ddFont.ListIndex, False)
    
End Sub

'Upon calling, validate all input.  Return FALSE if validation on 1+ controls fails.
Public Function ValidateAllInput() As Boolean
    
    ValidateAllInput = True
    
    Dim eControl As Object
    For Each eControl In Me.Controls
        
        'Most UI elements on this dialog are idiot-proof, but spin controls (including those embedded
        ' in slider controls) are an exception.
        If (TypeOf eControl Is pdSlider) Or (TypeOf eControl Is pdSpinner) Then
            
            'Finally, ask the control to validate itself
            If (Not eControl.IsValid) Then
                ValidateAllInput = False
                Exit For
            End If
            
        End If
    Next eControl
    
End Function

'This function is called at least once, immediately following Form_Load(),
' but it can be called again if the active language or theme changes.
Public Sub UpdateAgainstCurrentTheme()
    
    lblInfo(0).Caption = g_Language.TranslateMessage("Changes will take effect the next time you start PhotoDemon.")
    Interface.ApplyThemeAndTranslations Me
    
End Sub
