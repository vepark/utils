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

