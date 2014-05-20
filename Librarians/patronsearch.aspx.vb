
Partial Class Librarians_patronsearch
    Inherits System.Web.UI.Page
    Protected Sub patsearch_TextChanged(sender As Object, e As EventArgs) Handles patsearch.TextChanged
        Dim searchword As String
        searchword = "Select * from patrons where (LastName like '%" + patsearch.Text.ToString() + "%') or (FirstName Like '%" + patsearch.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchWord
    End Sub
End Class
