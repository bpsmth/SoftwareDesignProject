
Partial Class search
    Inherits System.Web.UI.Page
    Protected Sub msearchtb_TextChanged(sender As Object, e As EventArgs) Handles msearchtb.TextChanged
        Dim searchWord As String
        searchWord = "Select * from materials where (title like '%" + msearchtb.Text.ToString() + "%') or (ISBN Like '%" + msearchtb.Text.ToString() + "%') or (MaterialType Like '%" + msearchtb.Text.ToString() + "%') or (Author Like '%" + msearchtb.Text.ToString() + "%') or (Publisher Like '%" + msearchtb.Text.ToString() + "%') or (Copyright Like '%" + msearchtb.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchWord
    End Sub

    Protected Sub mobTb2_TextChanged(sender As Object, e As EventArgs) Handles mobTb2.TextChanged
        Dim searchWord2 As String
        searchWord2 = "Select * from materials where (title like '%" + mobTb2.Text.ToString() + "%') or (ISBN Like '%" + mobTb2.Text.ToString() + "%') or (MaterialType Like '%" + mobTb2.Text.ToString() + "%') or (Author Like '%" + mobTb2.Text.ToString() + "%') or (Publisher Like '%" + mobTb2.Text.ToString() + "%') or (Copyright Like '%" + mobTb2.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchWord2
    End Sub
End Class
