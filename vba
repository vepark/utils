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
Sub LockColumnsAndProtectSheetsByName()

    Dim ws As Worksheet
    Dim sheetNameNumber As Integer

    ThisWorkbook.Protect Structure:=True, Windows:=False, Password:="YourPasswordHere"

    ' Loop through each worksheet in the workbook
    For Each ws In ThisWorkbook.Sheets
    
        ' Error handling in case of non-convertible name to number
        On Error Resume Next
        sheetNameNumber = CInt(ws.Name)
        On Error GoTo 0
        
        ' Check if sheet name is a number between 201 and 231
        If sheetNameNumber >= 201 And sheetNameNumber <= 231 Then
        
            ' Unprotect the sheet in case it's protected
            ws.Unprotect Password:="YourPasswordHere" ' Optional: Change the password if needed
            
            ' Unlock all cells in the worksheet
            ws.Cells.Locked = False
            
            ' Lock cells in columns A, B, and C
            ws.Range("A:C").Locked = True
            
            ' Protect the entire sheet
            ws.Protect Password:="YourPasswordHere" ' Optional: Change the password if needed
        
        End If
        
    Next ws

End Sub




' check formula errrors

Sub CheckForFormulaErrors()

    Dim ws As Worksheet
    Dim rng As Range
    Dim cell As Range
    Dim errorSheets As String
    Dim hasError As Boolean

    ' Iterate through each worksheet in the workbook
    For Each ws In ThisWorkbook.Worksheets
        hasError = False
        
        ' Check only the cells with formulas
        On Error Resume Next
        Set rng = ws.UsedRange.SpecialCells(xlCellTypeFormulas)
        On Error GoTo 0

        ' If the worksheet has formulas, then check for errors
        If Not rng Is Nothing Then
            For Each cell In rng
                If IsError(cell.Value) Then
                    hasError = True
                    Exit For
                End If
            Next cell
        End If

        ' If the worksheet has an error, append its name to the errorSheets string
        If hasError Then
            errorSheets = errorSheets & ws.Name & ", "
        End If

    Next ws

    ' Display the sheets with errors
    If errorSheets <> "" Then
        errorSheets = Left(errorSheets, Len(errorSheets) - 2)  ' Removing the trailing comma and space
        MsgBox "Sheets with errors: " & errorSheets
    Else
        MsgBox "No sheets with formula errors found."
    End If

End Sub


