Imports System.Data.SqlClient

Partial Class Librarians_addmaterial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        ddl_MaterialType.Focus()

    End Sub

    Protected Sub btn_Add_Click(sender As Object, e As EventArgs) Handles btn_Add.Click

        Dim strMaterialType As String = ddl_MaterialType.SelectedItem.Text
        Dim strTitle As String = tb_Title.Text
        Dim strAuthor As String = tb_Author.Text
        Dim strPublisher As String = tb_Publisher.Text
        Dim intCopyright As String = tb_Copyright.Text
        Dim strDescription As String = tb_Description.Text
        Dim strAvailability As String = tb_Availability.Text
        Dim strCallNumber As String = tb_CallNumber.Text
        Dim intISBN As String = tb_ISBN.Text

        Dim filepath As String = Server.MapPath("..\images")

        If fileUpload.HasFile Then
            Try
                fileUpload.SaveAs(filepath & "\" & intISBN & ".jpg")
            Catch ex As Exception
            End Try
        End If

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL1").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_Add"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@MaterialType", strMaterialType))
        sqlCmd.Parameters.Add(New SqlParameter("@Title", strTitle))
        sqlCmd.Parameters.Add(New SqlParameter("@Author", strAuthor))
        sqlCmd.Parameters.Add(New SqlParameter("@Publisher", strPublisher))
        sqlCmd.Parameters.Add(New SqlParameter("@Copyright", intCopyright))
        sqlCmd.Parameters.Add(New SqlParameter("@Description", strDescription))
        sqlCmd.Parameters.Add(New SqlParameter("@Availability", strAvailability))
        sqlCmd.Parameters.Add(New SqlParameter("@ImageText", intISBN & ".jpg"))
        sqlCmd.Parameters.Add(New SqlParameter("@CallNumber", strCallNumber))
        sqlCmd.Parameters.Add(New SqlParameter("@ISBN", intISBN))
        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Write("<script>alert('The material has been added to the database.');<script>")
        Response.AddHeader("REFRESH", "3;URL=viewmaterials.aspx")

    End Sub

    Protected Sub btn_Cancel_Click(sender As Object, e As EventArgs) Handles btn_Cancel.Click
        Response.Redirect("viewmaterials.aspx")
    End Sub
End Class
