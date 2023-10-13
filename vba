Sub LockAllExceptDWithValue()

    Dim ws As Worksheet
    Dim cell As Range

    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Worksheets
        
        ' Unprotect the sheet in case it's protected
        ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        ' Lock all cells in the worksheet
        ws.Cells.Locked = True
        
        ' Unlock cells in column D that have values
        For Each cell In ws.Range("D1:D" & ws.Cells(ws.Rows.Count, "D").End(xlUp).Row)
            If cell.Value <> "" Then
                cell.Locked = False
            End If
        Next cell
        
        ' Protect the entire sheet
        ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
    Next ws

End Sub




Sub LockAllExceptDWithValue()

    Dim ws As Worksheet
    Dim cell As Range

    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Worksheets
        
        ' Unprotect the sheet in case it's protected
        ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        ' Lock all cells in the worksheet
        ws.Cells.Locked = True
        
        ' Unlock cells in column D that have values
        For Each cell In ws.Range("D1:D" & ws.Cells(ws.Rows.Count, "D").End(xlUp).Row)
            ' Check if the cell does not have an error value
            If Not IsError(cell.Value) Then
                ' If the cell is not blank, unlock it
                If cell.Value <> "" Then
                    cell.Locked = False
                End If
            End If
        Next cell
        
        ' Protect the entire sheet
        ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
    Next ws

End Sub










Sub LockABCAndProtect()

    Dim ws As Worksheet

    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Worksheets
    
        ' Unprotect the sheet in case it's protected
        ws.Unprotect Password:="YourPasswordHere"  ' Optional: Change the password if needed
        
        ' Unlock all cells in the worksheet
        ws.Cells.Locked = False
        
        ' Lock only cells in columns A, B, and C
        ws.Range("A:C").Locked = True
        
        ' Protect the entire sheet
        ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
    Next ws

End Sub





' Unlock all sheets and unprotect

Sub UnlockAndUnprotectAllSheets()

    Dim ws As Worksheet

    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Sheets
    
        ' Unprotect the sheet in case it's protected
        ' Note: If a password has been set, it needs to be specified here
        ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        ' Unlock all cells in the worksheet
        ws.Cells.Locked = False
        
    Next ws
    
End Sub



' Lock A to C columns in all sheets
Sub LockColumnsAndProtectAllSheets()

    Dim ws As Worksheet
    
    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Sheets
        
        ' Unprotect the sheet in case it's protected
        ' Note: If a password has been set, it needs to be specified here
        ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        ' Unlock all cells in the worksheet
        ws.Cells.Locked = False
        
        ' Lock cells in columns A, B, and C
        ws.Range("A:C").Locked = True
        
        ' Protect the entire sheet
        ' Note: If you want to set a password for protection, specify it here
        ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
    Next ws

End Sub





' Unmerge and merge if that is causing issue to lock
Sub LockColumnsAndProtectAllSheets()

    Dim ws As Worksheet
    Dim mergedCells As Collection
    Dim cell As Range
    
    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Sheets
        
        Set mergedCells = New Collection
        
        ' Unprotect the sheet in case it's protected
        ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        ' Unlock all cells in the worksheet
        ws.Cells.Locked = False
        
        ' Check for merged cells in columns A:C and unmerge them, saving their references to remerge later
        For Each cell In ws.Range("A:C").Cells
            If cell.MergeCells Then
                mergedCells.Add cell.MergeArea.Address
                cell.MergeArea.UnMerge
            End If
        Next cell
        
        ' Lock cells in columns A, B, and C
        ws.Range("A:C").Locked = True
        
        ' Remerge previously merged cells
        For Each cell In mergedCells
            ws.Range(cell).Merge
        Next cell
        
        ' Protect the entire sheet
        ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
    Next ws

End Sub




' by sheet range - lock only them
Sub LockColumnsAndProtectSheetsByIndex()

    Dim ws As Worksheet
    Dim i As Integer
    
    ' Loop through sheets 201 to 231
    For i = 201 To 231
    
        ' Error handling in case of invalid sheet index
        On Error Resume Next
        Set ws = ThisWorkbook.Sheets(i)
        On Error GoTo 0
        
        ' Check if sheet exists
        If Not ws Is Nothing Then
        
            ' Unprotect the sheet in case it's protected
            ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
            
            ' Unlock all cells in the worksheet
            ws.Cells.Locked = False
            
            ' Lock cells in columns A, B, and C
            ws.Range("A:C").Locked = True
            
            ' Protect the entire sheet
            ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
            
            ' Clear the sheet object
            Set ws = Nothing
        Else
            MsgBox "Sheet index " & i & " does not exist.", vbExclamation
        End If
        
    Next i

End Sub
