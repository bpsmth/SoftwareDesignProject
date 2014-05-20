Imports System.Data.SqlClient

Partial Class Librarians_return
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        tb_ISBN.Focus()
    End Sub

    Protected Sub btn_Return_Click(sender As Object, e As EventArgs) Handles btn_Return.Click
        Dim strISBN As String = tb_ISBN.Text

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL1").ConnectionString)
        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_ReturnMaterial"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@ISBN", strISBN))

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("viewrentals.aspx")

    End Sub
End Class
