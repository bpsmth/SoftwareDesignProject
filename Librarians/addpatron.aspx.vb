Imports System.Data.SqlClient

Partial Class Librarians_addpatron
    Inherits System.Web.UI.Page

    Protected Sub ContinueButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("viewpatron.aspx")
    End Sub

    Protected Sub CreateUserWizard1_ActiveStepChanged(sender As Object, e As EventArgs) Handles CreateUserWizard1.ActiveStepChanged

        If CreateUserWizard1.ActiveStep.Title = "Complete" Then

            Dim UserSettings As WizardStep = CType(CreateUserWizard1.FindControl("UserProfile"), WizardStep)

            Dim FirstName As TextBox = CType(UserSettings.FindControl("tb_FirstName"), TextBox)
            Dim LastName As TextBox = CType(UserSettings.FindControl("tb_LastName"), TextBox)
            Dim BirthDate As TextBox = CType(UserSettings.FindControl("tb_BirthDate"), TextBox)
            Dim Address1 As TextBox = CType(UserSettings.FindControl("tb_Address1"), TextBox)
            Dim Address2 As TextBox = CType(UserSettings.FindControl("tb_Address2"), TextBox)
            Dim City As TextBox = CType(UserSettings.FindControl("tb_City"), TextBox)
            Dim State As String = ddl_State.SelectedItem.Text
            Dim Zip As TextBox = CType(UserSettings.FindControl("tb_Zip"), TextBox)
            Dim PhoneNumber1 As TextBox = CType(UserSettings.FindControl("tb_PhoneNumber1"), TextBox)
            Dim PhoneNumber2 As TextBox = CType(UserSettings.FindControl("tb_PhoneNumber2"), TextBox)
            Dim Email As TextBox = CType(UserSettings.FindControl("tb_Email"), TextBox)

            Dim newuser As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)
            Dim newuserid As Guid = CType(newuser.ProviderUserKey, Guid)

            Roles.AddUserToRole(newuser.UserName, "patron")

            Dim connectionString As String = ConfigurationManager.ConnectionStrings("cs_SLPL1").ConnectionString
            Dim updatesql As String = "INSERT INTO [Patrons] ([UserId], [FirstName], [LastName], [Birthdate], [Address1], [Address2], [City], [State], [ZipCode], [PhoneNumber1], [PhoneNumber2], [PrimaryEmail]) VALUES (@UserId, @FirstName, @LastName, @Birthdate, @Address1, @Address2, @City, @State, @ZipCode, @PhoneNumber1, @PhoneNumber2, @PrimaryEmail)"

            Using myConnection As New SqlConnection(connectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(updatesql, myConnection)
                myCommand.Parameters.Add(New SqlParameter("@State", State))
                myCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim())
                myCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim())
                myCommand.Parameters.AddWithValue("@Birthdate", BirthDate.Text.Trim())
                myCommand.Parameters.AddWithValue("@Address1", Address1.Text.Trim())
                myCommand.Parameters.AddWithValue("@Address2", Address2.Text.Trim())
                myCommand.Parameters.AddWithValue("@City", City.Text.Trim())
                myCommand.Parameters.AddWithValue("@ZipCode", Zip.Text.Trim())
                myCommand.Parameters.AddWithValue("@PhoneNumber1", PhoneNumber1.Text.Trim())
                myCommand.Parameters.AddWithValue("@PhoneNumber2", PhoneNumber2.Text.Trim())
                myCommand.Parameters.AddWithValue("@PrimaryEmail", Email.Text.Trim())
                myCommand.Parameters.AddWithValue("@UserId", newuserid)
                myCommand.ExecuteNonQuery()
                myConnection.Close()
            End Using

        End If


    End Sub
End Class
