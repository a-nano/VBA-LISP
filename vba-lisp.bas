Attribute VB_Name = "Module1"

Sub VbaLisp()
    Dim Workbook_path As String
    Dim WSH, wExec, sCmd As String, Result As String
    Dim LispCommand As String
    
    Thisbook_path = ThisWorkbook.Path   ''���̃}�N�������s���ꂽPath���擾
    
    LispCommand = Replace(Replace(Range("B2").Value, vbLf, " "), """", "\""") ''lisp�R�}���h���擾���A���s���󔒂ɕϊ��A"��\�ŃG�X�P�[�v
    
    Set WSH = CreateObject("WScript.Shell")
'    sCmd = Thisbook_path & "\repl.exe " & """" & LispCommand & """" '' exe�t�@�C���̏ꍇ�B�����ɃR�}���h���L��
    sCmd = "ros " & Thisbook_path & "\repl.ros " & """" & LispCommand & """" ''roswell�X�N���v�g�̏ꍇ�B�����ɃR�}���h���L��
    Set wExec = WSH.Exec("%ComSpec% /c " & sCmd)        ''"%ComSpec%"�͂��܂��Ȃ�
    Do While wExec.Status = 0       ''�O���̃v���O�������I������܂ő҂�������A�����E�E
        DoEvents
    Loop
    Result = wExec.StdOut.ReadAll   ''Result�ɕW���o�͂̌��ʂ��i�[
    Set wExec = Nothing
    Set WSH = Nothing
    
    Range("K2").Value = Result

End Sub

