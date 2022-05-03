' This is the code in GUI_mysql.xlsm

Option Explicit

Sub Test()
    Dim lastColumn As Long
    lastColumn = Worksheets(3).Cells(1, Columns.Count).End(xlToLeft).Column
    Worksheets(3).Columns("D:" & Col_Letter(lastColumn)).Delete
End Sub

Function Col_Letter(lngCol As Long) As String
    Dim vArr
    vArr = Split(Cells(1, lngCol).Address(True, False), "$")
    Col_Letter = vArr(0)
End Function


Sub Connect()
    Dim connectionString As String
    Dim password As String
    Dim serverName As String
    Dim userID As String
    Dim databaseName As String
    Dim qt As QueryTable
    Dim lastColumn As Long

    lastColumn = Worksheets(3).Cells(1, Columns.Count).End(xlToLeft).Column
    serverName = Range("B2").Value
    databaseName = Range("B3").Value
    userID = Range("B4").Value
    password = Range("B5").Value
    
    connectionString = "ODBC;DRIVER={MySQL ODBC 8.0 Unicode Driver};" _
    & "SERVER=" & serverName & ";DATABASE=" & databaseName & ";" _
    & "UID=" & userID & ";PWD=" & password & ";Port=3306"
    
    For Each qt In ActiveSheet.QueryTables
        If qt.Refreshing Then qt.CancelRefresh
        qt.Delete
    Next
    
    If Not IsEmpty(Range("D1")) Then
        Worksheets(3).Columns("D:" & Col_Letter(lastColumn)).Delete
    End If
        
    With ActiveSheet.QueryTables.Add(Connection:=connectionString, Destination:=Range("D1"), Sql:=Range("B6"))
      .BackgroundQuery = False
      .Refresh
    End With
End Sub




