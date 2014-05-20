
Partial Class Mobile_mobmaterials
    Inherits System.Web.UI.Page
    Protected Sub msearchtb_TextChanged(sender As Object, e As EventArgs) Handles mobTb.TextChanged
        Dim searchWord As String
        searchWord = "Select * from materials where (title like '%" + mobTb.Text.ToString() + "%') or (ISBN Like '%" + mobTb.Text.ToString() + "%') or (MaterialType Like '%" + mobTb.Text.ToString() + "%') or (Author Like '%" + mobTb.Text.ToString() + "%') or (Publisher Like '%" + mobTb.Text.ToString() + "%') or (Copyright Like '%" + mobTb.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchWord
    End Sub

    Protected Sub mobTb2_TextChanged(sender As Object, e As EventArgs) Handles mobTb2.TextChanged
        Dim searchWord2 As String
        searchWord2 = "Select * from materials where (title like '%" + mobTb2.Text.ToString() + "%') or (ISBN Like '%" + mobTb2.Text.ToString() + "%') or (MaterialType Like '%" + mobTb2.Text.ToString() + "%') or (Author Like '%" + mobTb2.Text.ToString() + "%') or (Publisher Like '%" + mobTb2.Text.ToString() + "%') or (Copyright Like '%" + mobTb2.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchWord2
    End Sub
End Class

