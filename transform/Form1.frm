VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3150
   ClientLeft      =   60
   ClientTop       =   390
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3150
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Trans As Integer
Private Const LWA_COLORKEY = 1
Private Const LWA_ALPHA = 2
Private Const LWA_BOTH = 3
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = -20
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal color As Long, ByVal x As Byte, ByVal alpha As Long) As Boolean
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Sub SetTrans(hWnd As Long, Trans As Integer)
    Dim Tcall As Long
    Tcall = GetWindowLong(hWnd, GWL_EXSTYLE)
    SetWindowLong hWnd, GWL_EXSTYLE, Tcall Or WS_EX_LAYERED
    SetLayeredWindowAttributes hWnd, RGB(255, 255, 0), Trans, LWA_ALPHA
    Exit Sub
End Sub
Private Sub Form_Load()
    Trans = 100 ' number it 0 - 255 .. the LOWER the number the more transparent form becomes.
    SetTrans Me.hWnd, Trans
'for text box use this .. " Trans = Text1.Text " could also be easily put on a slider.
End Sub

