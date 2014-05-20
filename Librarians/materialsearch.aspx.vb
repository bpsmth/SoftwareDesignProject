
Partial Class Librarians_materialsearch
    Inherits System.Web.UI.Page
    Protected Sub libmsearch_TextChanged(sender As Object, e As EventArgs) Handles libmsearch.TextChanged
        Dim searchword As String
        searchword = "Select * from materials where (title like '%" + libmsearch.Text.ToString() + "%') or (ISBN Like '%" + libmsearch.Text.ToString() + "%') or (MaterialType Like '%" + libmsearch.Text.ToString() + "%') or (Author Like '%" + libmsearch.Text.ToString() + "%') or (Publisher Like '%" + libmsearch.Text.ToString() + "%') or (Copyright Like '%" + libmsearch.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchword

    End Sub
End Class
