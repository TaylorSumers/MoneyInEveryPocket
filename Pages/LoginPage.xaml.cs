using MoneyInEveryPocket.DatabaseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static MoneyInEveryPocket.DatabaseModel.AppConnect;


namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Interaction logic for LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {

        public LoginPage()
        {
            InitializeComponent();
        }

        private void Page_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            //TODO: Make a beautiful border resizing
            //brdMain.Width = this.ActualWidth*0.25 ;
            //brdMain.Height = this.ActualHeight*0.86;
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            int res = Validate(tbxEmail.Text, pbxPass.Password);
            switch (res)
            {
                case 0: 
                    MessageBox.Show("Польз не найден"); 
                    break;
                case 1:
                    MessageBox.Show("Неверный пароль");
                    break;
                case 2:
                    MessageBox.Show("OK");
                    break;
            }
        }

        private int Validate(string UserEmail, string UserPassword) 
        {
            //returns
            //0 - if info not founded,
            //1 - if password incorrect,
            //2 - if all OK
            User CurrentUser = cont.User.Where(user => user.UserEmail == UserEmail).SingleOrDefault();
            if (CurrentUser != null) 
            { 
                if (CurrentUser.UserPassword == UserPassword)
                    return 2;
                else 
                    return 1;
            }
            else
                return 0;
        }
    }
}
