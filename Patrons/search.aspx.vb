
Partial Class Patrons_search
    Inherits System.Web.UI.Page
    Protected Sub msearchtb_TextChanged(sender As Object, e As EventArgs) Handles msearchtb.TextChanged
        Dim searchWord As String

        searchWord = "Select * from materials where (title like '%" + msearchtb.Text.ToString() + "%') or (ISBN Like '%" + msearchtb.Text.ToString() + "%') or (MaterialType Like '%" + msearchtb.Text.ToString() + "%') or (Author Like '%" + msearchtb.Text.ToString() + "%') or (Publisher Like '%" + msearchtb.Text.ToString() + "%') or (Copyright Like '%" + msearchtb.Text.ToString() + "%')"


        SqlDataSource1.SelectCommand = searchWord
    End Sub
    
End Class
